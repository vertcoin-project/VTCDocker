#!/bin/bash

cd /root/vertcoin
export WORKSPACE=`pwd`
rm -rf build

export HOST=x86_64-w64-mingw32
make -j8 -C depends HOST=$HOST
./autogen.sh
mkdir build && cd build
../configure --disable-dependency-tracking --disable-tests --disable-bench --prefix=$WORKSPACE/depends/$HOST --enable-reduce-exports --disable-shared
make -j8
rm -rf /root/output/$HOST
mkdir -p /root/output/$HOST/bin
find $WORKSPACE/build/src/vertcoin* $WORKSPACE/build/src/qt/vertcoin* -maxdepth 2 -type f -not -name "*_*" -and -not -name "vertcoind-bitcoind.o" -exec mv {} /root/output/$HOST/bin \;

#QT_BINS=("/root/output/$HOST/bin/vertcoin-qt.exe")
#DAEMON_BINS=("/root/output/$HOST/bin/vertcoind.exe" "/root/output/$HOST/bin/vertcoin-tx.exe" "/root/output/$HOST/bin/vertcoin-cli.exe" "/root/output/$HOST/bin/vertcoin-wallet.exe" "/root/output/$HOST/bin/vertcoin-util.exe")
#
#strip --strip-unneeded "${QT_BINS[@]}" "${DAEMON_BINS[@]}"
#zip -j /root/output/vertcoind-windows-x64.zip "${DAEMON_BINS[@]}"
#zip -j /root/output/vertcoinqt-windows-x64.zip "${QT_BINS[@]}"
