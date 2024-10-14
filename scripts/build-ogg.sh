#!/bin/bash

# OGG container

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"

mkdir -p "${OUTPUT}"
cd ogg
./autogen.sh
./configure --host="${HOST}" --prefix="${OUTPUT}" --with-pic
make -j16
make install
