c
#mkdir build
#cd build
cd libass
./autogen.sh
./configure --host="${HOST}" --prefix="${OUTPUT}" --with-pic
make -j16
make install
