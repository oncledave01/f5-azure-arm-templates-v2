#!/bin/bash

apt-get -y update
apt-get -y upgrade


# install selks in docker
git clone https://github.com/StamusNetworks/SELKS.git
cd SELKS/docker/ && ./easy-setup.sh --non-interactive -i eth0 --iA --es-memory 6G
docker-compose up -d


cd  scripts
wget https://github.com/oncledave01/f5-azure-arm-templates-v2/raw/main/examples/lab5%20ips/pcap/2022-05-02-Brazil-sourced-malspam-infection.pcap
./readpcap.sh 2022-05-02-Brazil-sourced-malspam-infection.pcap
wget https://github.com/oncledave01/f5-azure-arm-templates-v2/raw/main/examples/lab5%20ips/pcap/2022-04-22-forensic-challenge-traffic.pcap
./readpcap.sh 2022-04-22-forensic-challenge-traffic.pcap