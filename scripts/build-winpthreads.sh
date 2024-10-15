#!/bin/bash

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"

git clone "https://git.code.sf.net/p/mingw-w64/mingw-w64.git" mingw-w64 --depth 1
# shellcheck disable=SC2164  
cd mingw-w64/mingw-w64-libraries/winpthreads
./configure --host="${HOST}" --prefix="${OUTPUT}" --with-pic --enable-shared --enable-static
make -j16
make install
