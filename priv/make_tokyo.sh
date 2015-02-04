#!/bin/bash

LDFLAGS=""
CXXFLAGS=""

HERE="$(dirname $0)"
cd "${HERE}"
TOKYO_PREFIX="$(pwd)/tokyo-root"

TOKYO=tokyocabinet-1.4.48

if [ ! -f "${TOKYO}.tar.gz" ]; then
	wget -c "http://fallabs.com/tokyocabinet/${TOKYO}.tar.gz"
fi &&
if [ ! -d "${TOKYO}" ]; then
	tar xzf "${TOKYO}.tar.gz"
fi &&
cd "${TOKYO}" &&
if [ ! -f Makefile ]; then
     ./configure --prefix "${TOKYO_PREFIX}"
else
    :
fi &&
if [ ! -d "$TOKYO_PREFIX" ]; then
	make --silent && make --silent install
fi
