#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
cd opus
./configure --host="${HOST}" --prefix="${OUTPUT}" --with-pic --disable-extra-programs
make -j16
make install
