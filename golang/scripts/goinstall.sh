#!/bin/bash

set -eu

VERSION=${1:-1.11.5}

curl -sL https://storage.googleapis.com/golang/go$VERSION.linux-amd64.tar.gz | tar zx -C /usr/local
curl -sL https://github.com/fatih/vim-go/archive/v1.19.tar.gz | tar zx -C $VIMPACKAGES/start 
