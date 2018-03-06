#!/bin/bash

set -eu

git config --global user.name "kklipsch"
git config --global user.email "kklipsch@example.com"
git config --global core.editor vi
git config --global alias.stat status


curl -sL https://github.com/github/hub/releases/download/v2.2.8/hub-linux-amd64-2.2.8.tgz | tar zx -C /tmp
/tmp/hub-linux-amd64-2.2.8/install 
cp /tmp/hub-linux-amd64-2.2.8/etc/* /usr/local/etc
rm /tmp/hub-linux-amd64-2.2.8/install 

#hub store things in ~/.config put that in the data directory for safekeeping
ln -s /root/data/config $HOME/.config
