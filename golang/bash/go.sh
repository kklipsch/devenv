source $HOME/.bash/base.sh

export GOROOT=/usr/local/go
export GOBIN=$HOME/gobin
export PATH=$GOBIN:$GOROOT/bin:$PATH

#first go path is used for go-get things to segregate them from my code
export GOPATH=$HOME/go-external

#dont search vendor files in golang projects
alias ag='ag --ignore vendor'
