#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
apt update
apt install -qy meson ninja-build nasm
meson setup --cross-file "${GITHUB_WORKSPACE}/${HOST}.txt" --prefix "${OUTPUT}" libvmaf libvmaf/build --buildtype release
ninja -vC libvmaf/build install
