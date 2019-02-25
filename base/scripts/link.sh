#!/bin/bash

set -eu

ln -s $DEVENV_VOLUME/data /root/data
ln -s $DEVENV_VOLUME/projects /root/projects

ln -s /root/data/bash_history $HOME/.bash_history

