#!/bin/bash

#gpg --import my-private-key.asc
#echo 'default-key F4E9482F0495F02EE1616E8450DB45AA31A8E93E' >> ~/.gnupg/gpg.conf
#echo 'trusted-key F4E9482F0495F02EE1616E8450DB45AA31A8E93E' >> ~/.gnupg/gpg.conf

rm -rf build

mkdir build && cd build
wget https://salsa.debian.org/vertion/vertcoin/-/archive/debian/${VERSION}-1/vertcoin-debian-${VERSION}-1.tar.gz
mv vertcoin-debian-${VERSION}-1.tar.gz vertcoin_${VERSION}.orig.tar.gz
tar -xvf vertcoin_${VERSION}.orig.tar.gz
cd vertcoin-debian-${VERSION}-1

# Test building packages
#dpkg-buildpackage

# Build source that gets uploaded to launchpad
debuild -S

dput mentors-ftp ../vertcoin_${VERSION}-1_source.changes
