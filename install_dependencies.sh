#!/bin/bash
# Script to install Triton dependencies on Ubuntu/Debian-based systems
# This script installs both mandatory and optional packages.

set -e

# Update package index
sudo apt-get update

# Basic build tools
sudo apt-get install -y build-essential cmake git pkg-config

# Mandatory dependency
sudo apt-get install -y libcapstone-dev

# Optional components
sudo apt-get install -y libboost-all-dev libpython3-dev libz3-dev llvm-dev clang

# Build Bitwuzla from source (optional)
BITWUZLA_VERSION="v0.4.0"
BITWUZLA_REPO="https://github.com/bitwuzla/bitwuzla.git"

if [ ! -d "bitwuzla" ]; then
    git clone --depth 1 --branch ${BITWUZLA_VERSION} ${BITWUZLA_REPO}
    pushd bitwuzla
    git submodule update --init
    mkdir build && cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON
    make -j$(nproc)
    sudo make install
    popd
    rm -rf bitwuzla
fi

# Done
