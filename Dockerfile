FROM ubuntu:18.04
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install apt-utils
RUN apt-get -y install build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git
RUN apt-get -y install software-properties-common
RUN apt-get -y install make cmake g++-multilib libtool binutils-gold python3 patch
RUN apt-get -y install g++-arm-linux-gnueabihf binutils-arm-linux-gnueabihf g++-riscv64-linux-gnu binutils-riscv64-linux-gnu g++-aarch64-linux-gnu binutils-aarch64-linux-gnu g++-mingw-w64-x86-64
RUN apt-get -y install zip bison
RUN add-apt-repository -y ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get -y install libdb4.8-dev libdb4.8++-dev
RUN mkdir -p proj && cd proj
RUN update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
RUN apt-get -y install librsvg2-bin libtiff-tools bsdmainutils imagemagick libz-dev python3-setuptools libtinfo5 xorriso
RUN apt-get -y install libevent-dev libgmp-dev bison
RUN apt-get -y install g++-8
COPY build-linux-only.sh /
COPY build-win-only.sh /
COPY build-osx-only.sh /
COPY build-arm-only.sh /
COPY build-aarch-only.sh /
COPY build-riscv64-only.sh /
COPY build-all.sh /
