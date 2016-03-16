#! /bin/bash

set -e

sudo apt-get update

# install basic dependencies
echo "[Install] dependencies"
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y wget

echo "[Install] docker"
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-get install -y apparmor
sudo apt-get install -y docker-engine

echo "[Usermod] Add vagrant user to docker group"
usermod -a -G docker vagrant

echo "[Install] docker-compose"
sudo curl -sL https://github.com/docker/compose/releases/download/1.6.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
