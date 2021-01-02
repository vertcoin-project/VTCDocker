#!/bin/bash
sudo rm -rf output
mkdir output

docker rm vertcoin-build

echo Starting build
docker run --detach --name vertcoin-build -v $PWD/../vertcoin-core-release:/root/vertcoin -v $PWD/output:/root/output vertcoinbuild ./build.sh