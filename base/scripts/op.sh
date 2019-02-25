#!/bin/bash

set -eu

OP_VERSION=v0.5.5

# install and verify op cli
wget https://cache.agilebits.com/dist/1P/op/pkg/$OP_VERSION/op_linux_amd64_$OP_VERSION.zip
unzip op_linux_amd64_$OP_VERSION.zip
mv op /usr/local/bin/op
rm op.sig
rm op_linux_amd64_$OP_VERSION.zip

#op stores sessions in ~/.op store that on the host 
ln -s /root/data/op $HOME/.op
