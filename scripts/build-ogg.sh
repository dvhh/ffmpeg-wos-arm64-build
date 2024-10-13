#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"

mkdir -p "${OUTPUT}"
cd ogg
./autogen.sh
./configure --host="${HOST}" --prefix="${OUTPUT}"
make -j16
make install