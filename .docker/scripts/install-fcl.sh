#!/usr/bin/env bash

apt-get --yes --force-yes install libeigen3-dev libccd-dev

fcl_DIR="/opt/fcl"
rm -rf "${fcl_DIR}"
git clone https://github.com/flexible-collision-library/fcl.git "${fcl_DIR}"
mkdir -p "${fcl_DIR}/build"
cd "${fcl_DIR}/build"
cmake ..
make
make install
