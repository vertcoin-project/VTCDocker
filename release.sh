#!/bin/bash
sudo rm -rf output
mkdir output

docker rm vertcoin-build-arm

echo Starting Arm build
docker run --detach --name vertcoin-build-arm -v $PWD/../vertcoin-core-release:/root/vertcoin -v $PWD/output:/root/output vertcoinbuild ./build-arm-only.sh


docker rm vertcoin-build-aarch

echo Starting aarch build
docker run --detach --name vertcoin-build-aarch -v $PWD/../vertcoin-core-release:/root/vertcoin -v $PWD/output:/root/output vertcoinbuild ./build-aarch-only.sh


#docker rm vertcoin-build-linux

#echo Starting Linux build
#docker run --name vertcoin-build-linux -v $PWD/../vertcoin-core-release:/root/vertcoin -v $PWD/output:/root/output vertcoinbuild ./build-linux-only.sh

#docker rm vertcoin-build-windows

#echo Starting Windows build
#docker run --name vertcoin-build-windows -v $PWD/../vertcoin-core-release:/root/vertcoin -v $PWD/output:/root/output vertcoinbuild ./build-win-only.sh

#docker rm vertcoin-build-osx

#echo Starting OS X build
#docker run --name vertcoin-build-osx -v $PWD/../vertcoin-core-release:/root/vertcoin -v $PWD/output:/root/output vertcoinbuild ./build-osx-only.sh
