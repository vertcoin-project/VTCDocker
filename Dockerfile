FROM ubuntu:18.04
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install apt-utils
RUN apt-get -y install build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git g++-mingw-w64-x86-64
RUN apt-get -y install software-properties-common
RUN apt-get -y install g++-arm-linux-gnueabihf g++-riscv64-linux-gnu binutils-riscv64-linux-gnu g++-aarch64-linux-gnu binutils-aarch64-linux-gnu
RUN apt-get -y install zip
RUN add-apt-repository -y ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get -y install libdb4.8-dev libdb4.8++-dev
RUN mkdir -p proj && cd proj
RUN update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
RUN update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix
RUN apt-get -y install cmake libcap-dev librsvg2-bin libz-dev libbz2-dev libtiff-tools python3-pip imagemagick
COPY build-linux-only.sh /
COPY build-win-only.sh /
COPY build-osx-only.sh /
COPY build-arm-only.sh /
COPY build.sh /