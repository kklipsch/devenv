#!/bin/bash

set -eu

mkdir -p $VIMPACKAGES/start
mkdir -p $VIMPACKAGES/opt

curl -sL https://github.com/tpope/vim-sensible/archive/v1.1.tar.gz | tar zx -C $VIMPACKAGES/start 
curl -sL https://github.com/kklipsch/vim-colorschemes/archive/v1.0.tar.gz | tar zx -C $VIMPACKAGES/start
curl -sL https://github.com/vim-syntastic/syntastic/archive/3.8.0.tar.gz | tar zx -C $VIMPACKAGES/start
curl -sL https://github.com/kklipsch/docker-vim/archive/v1.0.tar.gz | tar zx -C $VIMPACKAGES/start
curl -sL https://github.com/mrk21/yaml-vim/archive/v0.1.0.tar.gz | tar zx -C $VIMPACKAGES/start
