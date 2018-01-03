#!/bin/bash

set -eu

source $HOME/.bash/go.sh

# tools that the vim plugin uses for things
go get github.com/klauspost/asmfmt/cmd/asmfmt
go get github.com/kisielk/errcheck
go get github.com/davidrjenni/reftools/cmd/fillstruct
go get github.com/nsf/gocode
go get github.com/rogpeppe/godef
go get github.com/zmb3/gogetdoc
go get golang.org/x/tools/cmd/goimports
go get github.com/golang/lint/golint
go get github.com/alecthomas/gometalinter
go get github.com/fatih/gomodifytags
go get golang.org/x/tools/cmd/gorename
go get github.com/jstemmer/gotags
go get golang.org/x/tools/cmd/guru
go get github.com/josharian/impl
go get github.com/dominikh/go-tools/cmd/keyify
go get github.com/fatih/motion

# always want dep
go get -u github.com/golang/dep/cmd/dep
