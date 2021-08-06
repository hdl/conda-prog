#!/bin/bash

set -e
set -x

if [ x"$TRAVIS" = xtrue ]; then
	CPU_COUNT=2
fi

unset CFLAGS

mkdir build
cd build
cmake ../ -DENABLE_UDEV=OFF -DCMAKE_INSTALL_PREFIX=$PREFIX

make -j$CPU_COUNT

make install
