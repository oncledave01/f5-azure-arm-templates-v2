#!/bin/bash

apt-get -y update

# install Docker
apt-get -y install docker.io

# install demo app
docker run --name f5demo -p 80:8008 -p 443:443 -d karthequian/gruyere:latest
#f5devcentral/f5-demo-app:latest
