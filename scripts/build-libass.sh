#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
#mkdir build
#cd build
cd libass
./configure --host="${HOST}" --prefix="${OUTPUT}" --with-pic
make -j16
make install
