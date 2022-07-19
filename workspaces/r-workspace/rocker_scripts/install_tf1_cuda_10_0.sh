#!/bin/bash
set -e

# Tensorflow 1.x is required for numerous projects.
# Even the most recent of the 1.x, 1.15.5 is compatible only
# with CUDA 10.0 versions of the following libraries.

# Fortunately, these are available from the NVIDIA Ubuntu debian PPA repos added in 10.1 images

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
    cuda-cudart-10-0 \
    cuda-cufft-10-0 \
    cuda-cusolver-10-0 \
    cuda-curand-10-0 \
    cuda-cusparse-10-0 \
    cuda-cublas-10-0

# Clean up
rm -rf /var/lib/apt/lists/*
