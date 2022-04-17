#!/bin/bash
rm .bash_history
rm .wget-hsts
rm -r .cache*
rm -r .gnupg
rm -r .local
docker stop debian-vtc
docker rm debian-vtc

docker run -it -d --name debian-vtc -v $PWD:/root debianvtc bash
docker exec -w /root -it debian-vtc /bin/bash