#!/bin/bash

set -euxo pipefail

OUTPUT="${1}"
HOST="${2}"
mkdir -p "${OUTPUT}"
apt update
apt install -qy cmake yasm cmake-curses-gui
ln -s "/opt/llvm-mingw/bin/${HOST}-windres" /bin/windres
git clone https://bitbucket.org/multicoreware/x265_git.git x265 -b stable
cd x265/build/linux
export PKG_CONFIG_LIBDIR="${OUTPUT}/lib/pkgconfig"
cmake -DCMAKE_TOOLCHAIN_FILE="${GITHUB_WORKSPACE}/${HOST}.cmake" -DCMAKE_INSTALL_PREFIX="${OUTPUT}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_ASM_NASM_FLAGS=-w-macro-params-legacy ../../source
make -j16
make install
