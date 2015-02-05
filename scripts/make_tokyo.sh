#!/bin/bash

set -e

pushd ${PWD}/deps/
if [ ! -d tokyocabinet ]; then
    tar xzf tokyocabinet-1.4.48.tar.gz
    mv tokyocabinet-1.4.48 tokyocabinet
fi

pushd tokyocabinet

if [ ! -f Makefile ]; then
    ./configure
fi

LDFLAGS="" CXXFLAGS="" make

mkdir -p ../../priv/
cp libtokyocabinet.so.9.11.0 ../../priv/libtokyocabinet.so.9
cp tchmgr ../../priv/

popd
popd
