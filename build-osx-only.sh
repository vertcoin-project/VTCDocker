#!/bin/bash

cd /root/vertcoin
export WORKSPACE=`pwd`
rm -rf build

export HOST=x86_64-apple-darwin16
### Place Xcode-11.3.1-11C505-extracted-SDK-with-libcxx-headers in depends/SDKs
make -j32 -C depends HOST=$HOST
mkdir -p $WORKSPACE/out/$HOST
./autogen.sh
mkdir build && cd build
../configure --disable-dependency-tracking --disable-tests --disable-bench --prefix=$WORKSPACE/depends/$HOST --bindir=$WORKSPACE/out/$HOST/bin --libdir=$WORKSPACE/out/$HOST/lib --disable-shared
make -j32 install
make deploy
cp Vertcoin-Core.dmg $WORKSPACE/out/$HOST
cd ../
rm -rf build
rm -rf /root/output/$HOST
mv $WORKSPACE/out/$HOST /root/output/$HOST

DAEMON_BINS=("/root/output/$HOST/bin/vertcoind" "/root/output/$HOST/bin/vertcoin-tx" "/root/output/$HOST/bin/vertcoin-cli" "/root/output/$HOST/bin/vertcoin-wallet")

strip --strip-unneeded "${DAEMON_BINS[@]}"
zip -j /root/output/vertcoind-osx-x64.zip "${DAEMON_BINS[@]}"
cp /root/output/$HOST/Vertcoin-Core.dmg /root/output/vertcoinqt.dmg