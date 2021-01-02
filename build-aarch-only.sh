#!/bin/bash

cd /root/vertcoin
export WORKSPACE=`pwd`
rm -rf build

export HOST=aarch64-linux-gnu NO_QT=1
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

zip /root/output/vertcoind-aarch64-linux-gnu.zip /root/output/$HOST/bin/vertcoind.exe /root/output/HOST/bin/vertcoin-tx.exe /root/output/$HOST/bin/vertcoin-cli.exe