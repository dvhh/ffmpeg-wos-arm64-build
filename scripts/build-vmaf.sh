#!/bin/bash

# VMAF Library
set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
apt update
apt install -qy meson ninja-build nasm
pushd vmaf
ls libvmaf
meson setup \
  --cross-file "${GITHUB_WORKSPACE}/hosts/${HOST}.txt" \
  --includedir "${OUTPUT}/include" \
  --libdir "${OUTPUT}/lib" \
  --prefix "${OUTPUT}" \
  -Dbuilt_in_models=true \
  -Denable_tests=false \
  -Denable_docs=false \
  libvmaf libvmaf/build --buildtype release
ninja -vC libvmaf/build install
