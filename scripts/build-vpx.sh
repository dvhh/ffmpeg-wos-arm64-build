#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
git clone https://chromium.googlesource.com/webm/libvpx --depth 1 -b v1.14.1 vpx
cd vpx
export PKG_CONFIG_LIBDIR="${OUTPUT}/lib/pkgconfig"

TARGET="$(grep "${HOST}" "${GITHUB_WORKSPACE}/hosts/host2target.txt" | cut -d " " -f 2)"
./configure --target="${TARGET}" --prefix="${OUTPUT}" --enable-pic --disable-examples --disable-tools --disable-tools --disable-tools --disable-tools
make -j16
make install
