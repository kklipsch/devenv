#!/bin/bash

set -eu

USER=$1
HOME=$2

# makes the provided user and their home directory, then sets them up for sudo no password usage
useradd -l -r -d $HOME $USER 
mkdir -p $HOME && chown -R $USER $HOME
echo $USER:password | chpasswd
adduser $USER sudo
mkdir -p /etc/sudoers.d
echo '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' >/etc/sudoers.d/$USER
