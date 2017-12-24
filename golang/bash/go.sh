source $HOME/.bash/base.sh

export GOROOT=/usr/local/go
export GOBIN=$HOME/bin
export PATH=$GOBIN:$GOROOT/bin:$PATH

#first go path is used for go-get things to segregate them from my code
export GOPATH=$HOME/src:$HOME/projects/go
