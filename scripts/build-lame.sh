#!/bin/bash

# AAC Codec

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"

cd lame
export CFLAGS="$CFLAGS -DNDEBUG -Wno-error=incompatible-pointer-types"
./configure --host="${HOST}" --prefix="${OUTPUT}" --with-pic --enable-nasm --disable-gtktest --disable-cpml --disable-frontend
make -j16
make install
