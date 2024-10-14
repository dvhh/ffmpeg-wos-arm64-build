#!/bin/bash

# AAC Codec

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"

cd lame
./configure --host="${HOST}" --prefix="${OUTPUT}" --with-pic
make -j16
make install
