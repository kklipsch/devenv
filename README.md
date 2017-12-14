# devenv - build development environments using only docker

To initialize a host machine to use dev environments:

```
docker pull kklipsch/devenv:init
docker rm init
eval "$(docker run --name init kklipsch/devenv:init)"
docker rm init
source ~/.bashrc
```

## Setting up a Macintosh to be a devenv host machine

Make sure the following is installed:
- docker
- chrome
- iterm 2
- seil (if in a pre-sierra OS)
- one password
- gpg suite 2

On a personal machine, setup a new Standard User for development.

- change the icon
- first sign in
- change background
- change caps lock to escape. Pre-sierra use seil, otherwise use system preferences
- change scroll behavior
- clean up the dock
- setup 1password / chrome extension
- set item2 Default profile 'send text at start' to be "gpgconf --kill gpg-agent && gpg-agent --enable-ssh-support --daemon /bin/bash"
