#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
git clone https://gitlab.freedesktop.org/freetype/freetype.git freetype
cd freetype
./autogen.sh
./configure --host="${HOST}" --prefix="${OUTPUT}"
make -j16
make install
