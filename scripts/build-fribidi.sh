#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
cd fibidi
./autogen.sh
./configure --host="${HOST}" --prefix="${OUTPUT}" --with-pic --disable-example
make -j16
make install
