#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
apt update
apt install -qy meson ninja-build nasm
mkdir build
cd build
export PKG_CONFIG_LIBDIR="${OUTPUT}/lib/pkgconfig"
export PKG_CONFIG_PATH="${OUTPUT}/lib/pkgconfig"
meson setup \
  --cross-file "${GITHUB_WORKSPACE}/hosts/${HOST}.txt" \
  --includedir "${OUTPUT}/include" \
  --libdir "${OUTPUT}/lib" \
  --prefix "${OUTPUT}" \
  --pkg-config-path "${OUTPUT}/lib/pkgconfig" \
  -Dfreetype=enabled \
  -Dglib=disabled \
  -Dgobject=disabled \
  -Dcairo=disabled \
  -Dchafa=disabled \
  -Dtests=disabled \
  -Dintrospection=disabled \
  -Ddocs=disabled \
  -Ddoc_tests=false \
  -Dutilities=disabled \
  -Dgdi=enabled \
  ../harfbuzz
ninja -j$(nproc)
ninja install
