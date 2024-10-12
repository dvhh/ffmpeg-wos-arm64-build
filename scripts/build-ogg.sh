#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
mkdir -p "${OUTPUT}"
cd ogg
./autogen.sh
./configure --host=aarch64-w64-mingw32 --prefix="${OUTPUT}"
make -j16
make install
