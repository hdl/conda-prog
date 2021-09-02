#!/bin/bash

mkdir build
cd build

export PKG_CONFIG_PATH=$BUILD_PREFIX/lib/pkgconfig

echo "--------------------------"
which pkg-config
echo "--------------------------"
pkg-config --debug --libs libusb-1.0
echo "--------------------------"

cmake ../ -DCMAKE_INSTALL_PREFIX="$PREFIX" -DHIDAPI_WITH_HIDRAW="FALSE" -DHIDAPI_WITH_LIBUSB="TRUE"

cmake --build .
cmake --build . --target install
