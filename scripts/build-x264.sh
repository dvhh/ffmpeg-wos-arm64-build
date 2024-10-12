#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"

git clone --depth=1 https://code.videolan.org/videolan/x264.git x264
cd x264
export PKG_CONFIG_LIBDIR="${OUTPUT}/lib/pkgconfig"
./configure --host="${HOST}" --prefix="${OUTPUT}" --enable-pic --enable-lto --cross-prefix="${HOST}-" --enable-shared --enable-static
make -j16
make install
