#!/bin/bash

set -eu

# install docker ce
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" 
apt-get update
apt-get install -y docker-ce 
apt-get autoremove -y 
apt-get autoclean -y


#docker stores things in ~/.docker put that in the data directory for safekeeping
mkdir -p /root/data/docker
ln -s /root/data/docker $HOME/.docker

# install docker compose
curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# install docker compose command completion
curl -L https://raw.githubusercontent.com/docker/compose/1.19.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
