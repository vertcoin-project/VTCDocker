#!/bin/bash

cd /root/vertcoin
export WORKSPACE=`pwd`
rm -rf build

export HOST=x86_64-unknown-linux-gnu
make -j8 -C depends HOST=$HOST
mkdir -p $WORKSPACE/out/$HOST
./autogen.sh
mkdir build && cd build
../configure --disable-dependency-tracking --disable-tests --disable-bench --enable-glibc-back-compat --prefix=$WORKSPACE/depends/$HOST --enable-reduce-exports --bindir=$WORKSPACE/out/$HOST/bin --libdir=$WORKSPACE/out/$HOST/lib
make -j8 install
cd ../
rm -rf build
rm -rf /root/output/$HOST
mv $WORKSPACE/out/$HOST /root/output/$HOST

zip -j /root/output/vertcoind-linux-x64.zip /root/output/$HOST/bin/vertcoind /root/output/$HOST/bin/vertcoin-tx /root/output/$HOST/bin/vertcoin-cli
zip -j /root/output/vertcoinqt-linux-x64.zip /root/output/$HOST/bin/vertcoin-qt


