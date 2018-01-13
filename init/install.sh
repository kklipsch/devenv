#!/bin/sh

set -eu

HOSTOS=${HOSTOS:-mac}
LOCATION=${LOCATION:-local}

rm -f $HOME/.bashrc
mkdir -p $HOME/devenv
mkdir -p $HOME/devenv/data
mkdir -p $HOME/devenv/projects

chown -R $USER devenv

if [ -f $HOME/.devenv/$HOSTOS.$LOCATION.bashrc ]; then
 	ln -s $HOME/.devenv/$HOSTOS.$LOCATION.bashrc $HOME/.bashrc	
else 
 	ln -s $HOME/.devenv/mac.local.bashrc $HOME/.bashrc	
fi

