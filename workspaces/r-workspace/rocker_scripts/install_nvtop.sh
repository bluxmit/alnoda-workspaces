#!/bin/bash
set -e

apt-get update && apt-get -y install cmake libncurses5-dev libncursesw5-dev git
git clone https://github.com/Syllo/nvtop.git
mkdir -p nvtop/build && cd nvtop/build
cmake .. -DNVML_RETRIEVE_HEADER_ONLINE=True
make
make install

# Clean up
rm -rf /var/lib/apt/lists/*
