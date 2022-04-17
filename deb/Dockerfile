FROM debian:bullseye
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
RUN apt-get -y install ntp make g++ gcc autoconf cpp ngrep iftop sysstat nano exiftool
RUN apt-get -y install git wget gnupg dput dh-make dh-exec devscripts bash-completion lintian lcov debhelper
RUN apt-get -y install libboost-chrono-dev libboost-filesystem-dev libboost-system-dev libboost-test-dev libboost-thread-dev
RUN apt-get -y install libevent-dev libprotobuf-dev libssl-dev protobuf-compiler
RUN apt-get -y install libzmq3-dev libsqlite3-dev libqrencode-dev libminiupnpc-dev libdb++-dev libleveldb-dev libunivalue-dev libsecp256k1-dev libgmp-dev
RUN apt-get -y install qt5-qmake qtbase5-dev qttools5-dev-tools

ENV VERSION=0.18.0
ENV DEBFULLNAME="vertion"
ENV DEBEMAIL="vertion@protonmail.com"

# import gpg private key, set as default-key and trusted-key in ~/.gnupg/gpg.conf
# edit /etc/dput.cf with [mentors-ftp] info