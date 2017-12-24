#!/bin/bash

set -eu

# install docker ce
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" 
apt-get update
apt-get install -y docker-ce 
apt-get autoremove -y 
apt-get autoclean -y

