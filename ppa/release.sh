#!/bin/bash
docker rm focal-vtc

echo 'Starting build'
echo 'Remember to import gpg private key'
echo 'gpg --import my-private-key.asc'
echo 'Remember to edit /etc/dput.cf'
echo '- replace [ppa] to [vertcoin-core]'
echo '- replace incoming = ~<your_launchpad_id>/ubuntu/ to'
echo '  incoming = ~vertcoin-project/ubuntu/vertcoin-core'
docker run -it -d --name focal-vtc -v $PWD:/root focalvtc bash
docker exec -w /root -it focal-vtc /bin/bash