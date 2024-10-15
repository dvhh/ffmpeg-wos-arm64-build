#!/bin/bash

# AV1 Codec

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
git clone https://aomedia.googlesource.com/aom aom
mkdir build
cd build
export PKG_CONFIG_LIBDIR="${OUTPUT}/lib/pkgconfig"
cmake -DCMAKE_TOOLCHAIN_FILE="${GITHUB_WORKSPACE}/hosts/${HOST}.cmake" -DCMAKE_INSTALL_PREFIX="${OUTPUT}" -DCMAKE_BUILD_TYPE=Release -DENABLE_EXAMPLES=NO -DENABLE_TESTS=NO -DENABLE_TOOLS=NO -DCONFIG_TUNE_VMAF=1 ../aom
make -j16
make install
