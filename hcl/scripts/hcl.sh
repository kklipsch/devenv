#!/bin/bash

set -eu

source $HOME/.bash/go.sh

# terraform vim plugin
curl -sL https://github.com/kklipsch/vim-terraform/archive/1.0.tar.gz | tar zx -C $VIMPACKAGES/start 

# hclfmt is a format program from hcl
go get github.com/fatih/hclfmt

# vim plugin for hclfmt
curl -sL https://github.com/kklipsch/vim-hclfmt/archive/1.0.tar.gz | tar zx -C $VIMPACKAGES/start 
