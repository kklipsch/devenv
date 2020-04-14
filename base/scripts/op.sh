#!/bin/bash

set -eu

OP_VERSION=v0.9.4

# install and verify op cli
wget https://cache.agilebits.com/dist/1P/op/pkg/$OP_VERSION/op_linux_amd64_$OP_VERSION.zip
unzip op_linux_amd64_$OP_VERSION.zip
mv op /usr/local/bin/op
rm op.sig
rm op_linux_amd64_$OP_VERSION.zip

#op stores sessions in ~/.op store that on the host 
# this stopped working but it means that each session requires the bad signin
#ln -s /root/data/op $HOME/.op
