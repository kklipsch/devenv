#!/bin/sh

set -eu

HOSTOS=${HOSTOS:-mac}
LOCATION=${LOCATION:-local}

rm -f $HOME/.bashrc

if [ -f $HOME/.devenv/$HOSTOS.$LOCATION.bashrc ]; then
 	ln -s $HOME/.devenv/$HOSTOS.$LOCATION.bashrc $HOME/.bashrc	
else 
 	ln -s $HOME/.devenv/mac.local.bashrc $HOME/.bashrc	
fi

