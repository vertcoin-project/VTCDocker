#!/bin/bash

cd /root/vertcoin
export WORKSPACE=`pwd`
rm -rf build

export HOST=x86_64-apple-darwin16
### Place Xcode-11.3.1-11C505-extracted-SDK-with-libcxx-headers in depends/SDKs
make -j8 -C depends HOST=$HOST
mkdir -p $WORKSPACE/out/$HOST
./autogen.sh
mkdir build && cd build
../configure --disable-dependency-tracking --disable-tests --disable-bench --prefix=$WORKSPACE/depends/$HOST --bindir=$WORKSPACE/out/$HOST/bin --libdir=$WORKSPACE/out/$HOST/lib --disable-shared
make -j8 install
make deploy
cp Vertcoin-Core.dmg $WORKSPACE/out/$HOST
cp -r Vertcoin-Qt.app $WORKSPACE/out/$HOST
cd ../
rm -rf build
rm -rf /root/output/$HOST
mv $WORKSPACE/out/$HOST /root/output/$HOST

DAEMON_BINS=("/root/output/$HOST/bin/vertcoind" "/root/output/$HOST/bin/vertcoin-tx" "/root/output/$HOST/bin/vertcoin-cli" "/root/output/$HOST/bin/vertcoin-wallet" "/root/output/$HOST/bin/vertcoin-qt")

strip --strip-unneeded "${DAEMON_BINS[@]}"
zip -j /root/output/vertcoin-osx.zip "${DAEMON_BINS[@]}"