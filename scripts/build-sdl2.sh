#!/bin/bash

# SDL2

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
mkdir build
cd build
../sdl2/configure --host="${HOST}" --prefix="${OUTPUT}" --with-pic
make -j16
make install
