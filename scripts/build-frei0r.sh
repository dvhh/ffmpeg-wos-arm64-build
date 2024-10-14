#!/bin/bash

# AAC Codec

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
mkdir build
cd build
export PKG_CONFIG_LIBDIR="${OUTPUT}/lib/pkgconfig"
cmake -DCMAKE_TOOLCHAIN_FILE="${GITHUB_WORKSPACE}/${HOST}.cmake" -DCMAKE_INSTALL_PREFIX="${OUTPUT}" -DCMAKE_BUILD_TYPE=Release -DENABLE_EXAMPLES=NO -DENABLE_TESTS=NO -DENABLE_TOOLS=NO -DCONFIG_TUNE_VMAF=1 ../frei0r
make -j16
make install
