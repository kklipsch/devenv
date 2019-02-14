#!/bin/bash

set -eu

git config --global user.name "kklipsch"
git config --global user.email "kklipsch@example.com"
git config --global core.editor vi
git config --global alias.stat status

hub_version=2.9.0
curl -sL https://github.com/github/hub/releases/download/v$hub_version/hub-linux-amd64-$hub_version.tgz | tar zx -C /tmp
/tmp/hub-linux-amd64-$hub_version/install 
cp /tmp/hub-linux-amd64-$hub_version/etc/* /usr/local/etc
rm /tmp/hub-linux-amd64-$hub_version/install 

#hub store things in ~/.config put that in the data directory for safekeeping
ln -s /root/data/config $HOME/.config
