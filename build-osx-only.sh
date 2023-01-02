#!/bin/bash

cd /root/vertcoin
export WORKSPACE=`pwd`
rm -rf build

export HOST=x86_64-apple-darwin18
### Place Xcode-12.1-12A7403-extracted-SDK-with-libcxx-headers in depends/SDKs
make -j8 -C depends HOST=$HOST
./autogen.sh
mkdir build && cd build
../configure --disable-dependency-tracking --disable-tests --disable-bench --prefix=$WORKSPACE/depends/$HOST --disable-shared
make -j8
make deploy
rm -rf /root/output/$HOST
mkdir -p /root/output/$HOST/bin
cp Vertcoin-Core.dmg /root/output/$HOST/bin
cp -r Vertcoin-Qt.app /root/output/$HOST/bin
find $WORKSPACE/build/src/vertcoin* $WORKSPACE/build/src/qt/vertcoin* -maxdepth 2 -type f -not -name "*_*" -and -not -name "vertcoind-bitcoind.o" -exec mv {} /root/output/$HOST/bin \;

#DAEMON_BINS=("/root/output/$HOST/bin/vertcoind" "/root/output/$HOST/bin/vertcoin-tx" "/root/output/$HOST/bin/vertcoin-cli" "/root/output/$HOST/bin/vertcoin-wallet" "/root/output/$HOST/bin/vertcoin-qt" "/root/output/$HOST/bin/vertcoin-util")
#
#strip --strip-unneeded "${DAEMON_BINS[@]}"
#zip -j /root/output/vertcoin-osx.zip "${DAEMON_BINS[@]}"
