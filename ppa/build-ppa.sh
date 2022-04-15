#!/bin/bash

rm -rf build
mkdir build && cd build
wget https://raw.githubusercontent.com/vertcoin-project/guix.sigs/main/${VERSION}/vertion/all.SHA256SUMS
wget https://github.com/vertcoin-project/vertcoin-core/releases/download/${VERSION}/vertcoin-${VERSION}.tar.gz
sha256sum --ignore-missing --check all.SHA256SUMS
mv vertcoin-${VERSION}.tar.gz vertcoin_${VERSION}-0~${RELEASE_VERSION}.orig.tar.gz
tar -xvf vertcoin_${VERSION}-0~${RELEASE_VERSION}.orig.tar.gz

git clone -b focal https://github.com/vertcoin-project/packaging

cp -r packaging/debian vertcoin-${VERSION}
cd vertcoin-${VERSION}

# Set version info with $RELEASE_VERSION, release target and notes
dch

# Build source that gets uploaded to launchpad
#debuild -S

# Test building packages
#dpkg-buildpackage

# Upload to launchpad
#dput vertcoin-core ../vertcoin_${VERSION}-0~${RELEASE_VERSION}_source.changes
