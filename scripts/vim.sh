#!/bin/bash

set -eu

export VIMPACKAGES=$HOME/.vim/pack/$USER

mkdir -p $VIMPACKAGES/start
mkdir -p $VIMPACKAGES/opt

cp $HOME/.vim/$DEVENV.vimrc $HOME/.vimrc

$HOME/.vim/plugins/$DEVENV.sh

