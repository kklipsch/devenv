#!/bin/bash

cat <<'DONE'
gpgconf /kill gpg-agent && $(gpg-agent --enable-ssh-support --daemon)
devenv(){ docker run -ti -v ${PWD}:/home/kklipsch/$(basename $PWD) kklipsch/devenv:$1; }
DONE
