#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
cd theora
./autogen.sh
./configure --host="${HOST}" --prefix="${OUTPUT}" --with-pic --disable-extra-programs --disable-examples --disable-examples --disable-examples --disable-examples --disable-doc
make -j16
make install
