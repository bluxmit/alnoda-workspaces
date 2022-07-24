#!/bin/bash
set -e

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

apt_install \
    gnupg2 \
    curl \
    ca-certificates

apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64 /" >/etc/apt/sources.list.d/cuda.list
echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64 /" >/etc/apt/sources.list.d/nvidia-ml.list
apt-get update

CUDA_VERSION=${CUDA_VERSION:-11.1.1}

# For libraries in the cuda-compat-* package: https://docs.nvidia.com/cuda/eula/index.html#attachment-a
apt_install \
    cuda-cudart-11-1=11.1.74-1 \
    cuda-compat-11-1

ln -s cuda-11.1 /usr/local/cuda

# Required for nvidia-docker v1
echo "/usr/local/nvidia/lib" >>/etc/ld.so.conf.d/nvidia.conf
echo "/usr/local/nvidia/lib64" >>/etc/ld.so.conf.d/nvidia.conf

## Set all of these as global ENV
# PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
# LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64

# NVIDIA_VISIBLE_DEVICES=all
#NVIDIA_DRIVER_CAPABILITIES="compute,utility"
# NVIDIA_REQUIRE_CUDA="cuda>=11.1 brand=tesla,driver>=418,driver<419 brand=tesla,driver>=440,driver<441 brand=tesla,driver>=450,driver<451"

## runtime ####################################################
##FROM ${IMAGE_NAME}:11.1-base-ubuntu20.04

NCCL_VERSION=${NCCL_VERSION:-2.7.8}

apt_install \
    cuda-libraries-11-1=11.1.1-1 \
    libnpp-11-1=11.1.2.301-1 \
    cuda-nvtx-11-1=11.1.74-1 \
    libcublas-11-1=11.3.0.106-1 \
    "libnccl2=$NCCL_VERSION-1+cuda11.1"

apt-mark hold libnccl2

## devel #######################################################

apt_install \
    cuda-nvml-dev-11-1=11.1.74-1 \
    cuda-command-line-tools-11-1=11.1.1-1 \
    cuda-nvprof-11-1=11.1.105-1 \
    libnpp-dev-11-1=11.1.2.301-1 \
    cuda-libraries-dev-11-1=11.1.1-1 \
    cuda-minimal-build-11-1=11.1.1-1 \
    libnccl-dev=2.7.8-1+cuda11.1 \
    libcublas-dev-11-1=11.3.0.106-1 \
    libcusparse-11-1=11.3.0.10-1 \
    libcusparse-dev-11-1=11.3.0.10-1
apt-mark hold libnccl-dev

# Clean up
rm -rf /var/lib/apt/lists/*
