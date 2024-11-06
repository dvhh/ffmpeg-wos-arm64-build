#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
apt update
apt install -qy meson ninja-build nasm
mkdir build
# cd fribidi
# ./autogen.sh
# ./configure --host="${HOST}" --prefix="${OUTPUT}" --with-pic --disable-example
# make -j16
# make install
meson setup \
  --cross-file "${GITHUB_WORKSPACE}/hosts/${HOST}.txt" \
  --includedir "${OUTPUT}/include" \
  --libdir "${OUTPUT}/lib" \
  --prefix "${OUTPUT}" \
  --buildtype=release \
  -Dbin=false \
  -Ddocs=false \
  -Dtests=false \
  ../fribidi
ninja -j$(nproc)
ninja install
