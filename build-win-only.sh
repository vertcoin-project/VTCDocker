#!/bin/bash

cd /root/vertcoin
make distclean
export WORKSPACE=`pwd`
rm -rf build

export HOST=x86_64-w64-mingw32
make -j8 -C depends HOST=$HOST
mkdir -p $WORKSPACE/out/$HOST
./autogen.sh
mkdir build && cd build
../configure --disable-dependency-tracking --disable-tests --disable-bench --prefix=$WORKSPACE/depends/$HOST --enable-reduce-exports --bindir=$WORKSPACE/out/$HOST/bin --libdir=$WORKSPACE/out/$HOST/lib --disable-shared
make -j8 install
cd ../
rm -rf build
rm -rf /root/output/$HOST
mv $WORKSPACE/out/$HOST /root/output/$HOST

zip -j /root/output/vertcoind-windows-x64.zip /root/output/$HOST/bin/vertcoind.exe /root/output/$HOST/bin/vertcoin-tx.exe /root/output/$HOST/bin/vertcoin-cli.exe /root/output/$HOST/bin/vertcoin-wallet.exe
zip -j /root/output/vertcoinqt-windows-x64.zip /root/output/$HOST/bin/vertcoin-qt.exe
