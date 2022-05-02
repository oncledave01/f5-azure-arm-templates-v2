#!/bin/bash

apt-get -y update

# install Docker
apt-get -y install docker.io

# install selks in docker
git clone https://github.com/StamusNetworks/SELKS.git
cd SELKS/docker/ && ./easy-setup.sh
docker-compose up -d
