#!/bin/bash

## not sure why cuda-cudart-dev-10-1 when this is 10.2 and we already have 10.2...

sudo apt update && \
  sudo apt install \
  libnvinfer-dev \
  cuda-cudart-dev-10-1 


