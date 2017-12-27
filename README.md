# devenv - build development environments using only docker

## Host machine options

devenv has the concepts:
- HOSTOS - what operating system the docker host you are setting the devenv up on.
- LOCATION - local/remote - local is if you are running connecting directly to the host, remote is if you are ssh'ing into it first.

| HOSTOS | LOCATION | DEFAULT |
| ------ | -------- | ---- |
| mac | local | X |
| linux | remote | |


To initialize a host machine to use the dev environment:

```
eval "$(docker run --name init kklipsch/devenv:init)"
```

you can override the defaults by:
```
export HOSTOS=mac
export LOCATION=local
eval "$(docker run --name init kklipsch/devenv:init)"
```

### A note about mac.local host machines

At the time of this writing Docker for Mac could not share a socket from the host hypervisor to a container nor could it share usb devices from the host to the containers.  This meant that we can't easily support yubikey based ssh keys (ie ssh agent style authorization).

To get around this, the hoaky work around is to start an sshd container, ssh to it forwarding the host agent, capture that socket in that container, and then share that socket via volumes with the dev environment.  Sharing sockets between 2 containers appears to work.  This hoaky work around can cause problems so be aware.

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
- add vimium to chrome
- set iterm2 Preferences/General/Select/Applications in Terminal May access selection
- set iterm2 Default profile - solarized color theme 
- set iterm2 Default profile 'send text at start' to be "gpgconf --kill gpg-agent && gpg-agent --enable-ssh-support --daemon /bin/bash"
