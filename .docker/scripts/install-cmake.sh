#!/bin/bash

# Set the CMake version
CMAKE_VERSION=${CMAKE_VERSION:-"3.29.3"}

# Download the CMake archive
wget "https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz"

# Extract the archive
tar -xzf "cmake-${CMAKE_VERSION}.tar.gz"

# Change to the CMake directory
cd "cmake-${CMAKE_VERSION}"

# Configure and build CMake
./bootstrap --prefix=/opt/cmake-${CMAKE_VERSION}
make
make install

# Add the CMake bin directory to the PATH
echo "export PATH=/opt/cmake-${CMAKE_VERSION}/bin:\$PATH" >>~/.bashrc

# Reload the shell configuration
source ~/.bashrc

# Clean up the downloaded archive and build directory
cd ..
rm -rf "cmake-${CMAKE_VERSION}" "cmake-${CMAKE_VERSION}.tar.gz"

echo "CMake ${CMAKE_VERSION} has been installed successfully."
