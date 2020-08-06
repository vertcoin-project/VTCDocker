#!/bin/bash

cd /root/vertcoin
make distclean
export WORKSPACE=`pwd`
rm -rf build

export HOST=x86_64-apple-darwin11
mkdir -p depends/SDKs depends/sdk-sources
curl https://bitcoincore.org/depends-sources/sdks/MacOSX10.14.sdk.tar.gz --output depends/sdk-sources/MacOSX10.14.sdk.tar.gz
tar -C depends/SDKs -xf depends/sdk-sources/MacOSX10.14.sdk.tar.gz
make -j8 -C depends HOST=$HOST
mkdir -p $WORKSPACE/out/$HOST
./autogen.sh
mkdir build && cd build
../configure --disable-dependency-tracking --disable-tests --disable-bench --prefix=$WORKSPACE/depends/$HOST --bindir=$WORKSPACE/out/$HOST/bin --libdir=$WORKSPACE/out/$HOST/lib --disable-shared
make -j8 install
make deploy
cp Vertcoin-Core.dmg $WORKSPACE/out/$HOST
cd ../
rm -rf build
rm -rf /root/output/$HOST
mv $WORKSPACE/out/$HOST /root/output/$HOST

zip -j /root/output/vertcoind-osx-x64.zip /root/output/$HOST/bin/vertcoind /root/output/$HOST/bin/vertcoin-tx /root/output/$HOST/bin/vertcoin-cli /root/output/$HOST/bin/vertcoin-wallet
cp /root/output/$HOST/Vertcoin-Core.dmg /root/output/vertcoinqt.dmg
