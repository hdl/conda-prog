#!/bin/bash

set -e
set -x

if [ x"$TRAVIS" = xtrue ]; then
	CPU_COUNT=2
fi

unset CFLAGS

cd "$BUILD_PREFIX/bin"
ln -s "$CC" gcc
cd -

make -j$CPU_COUNT

make install
