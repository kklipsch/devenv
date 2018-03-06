#!/bin/bash

set -eu

OP_VERSION=v0.3

# install and verify op cli
wget https://cache.agilebits.com/dist/1P/op/pkg/$OP_VERSION/op_linux_amd64_$OP_VERSION.zip
unzip op_linux_amd64_$OP_VERSION.zip
gpg --receive-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
gpg --verify op.sig op
mv op $HOME/bin
rm op.sig
rm op_linux_amd64_$OP_VERSION.zip

#op stores sessions in ~/.op store that on the host 
ln -s /root/data/op $HOME/.op
