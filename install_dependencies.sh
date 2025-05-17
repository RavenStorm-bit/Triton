#!/bin/bash
# Script to install Triton dependencies on Ubuntu/Debian-based systems
# This script installs both mandatory and optional packages.

set -e

# Basic build tools
sudo apt-get install -y build-essential cmake git pkg-config

# Mandatory dependency
sudo apt-get install -y libcapstone-dev

# Optional components
sudo apt-get install -y libboost-all-dev libpython3-dev libz3-dev llvm-dev clang

# Download Bitwuzla sources (optional)
BITWUZLA_VERSION="0.4.0"
BITWUZLA_REPO="https://github.com/bitwuzla/bitwuzla.git"

if [ ! -d "bitwuzla" ]; then
    git clone --depth 1 --branch ${BITWUZLA_VERSION} ${BITWUZLA_REPO}
    echo "Bitwuzla sources downloaded to ./bitwuzla. Build and install manually if needed."
fi

# Done
