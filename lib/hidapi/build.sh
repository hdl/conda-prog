#!/bin/bash

mkdir build
cd build

export PKG_CONFIG_PATH=$BUILD_PREFIX/lib/pkgconfig

echo "--------------------------"
which pkg-config
echo "--------------------------"
pkg-config --debug --libs libusb-1.0
echo "--------------------------"


# Identify OS
UNAME_OUT="$(uname -s)"
case "${UNAME_OUT}" in
	Linux*)     OS=Linux;;
	Darwin*)    OS=Mac;;
	*)          OS="${UNAME_OUT}"
		    echo "Unknown OS: ${OS}"
		    exit 1;;
esac

if [[ $OS == "Linux" ]]; then
	cmake ../ -DCMAKE_INSTALL_PREFIX="$PREFIX" -DHIDAPI_WITH_HIDRAW="FALSE"
elif [[ $OS == "Mac" ]]; then
	cmake ../ -DCMAKE_INSTALL_PREFIX="$PREFIX"
fi

cmake --build .
cmake --build . --target install
