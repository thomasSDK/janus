#!/bin/bash

wget https://github.com/cisco/libsrtp/archive/v2.3.0.tar.gz
tar xfv v2.3.0.tar.gz
cd libsrtp-2.3.0
./configure --prefix=/usr --enable-openssl
make shared_library && make install