FROM kklipsch/devenv:golang 

ADD scripts/* /usr/local/bin/
ADD vim $HOME/.vim

WORKDIR $HOME
RUN hcl.sh
RUN rm -f $HOME/.vimrc && ln -s $HOME/.vim/go.vimrc $HOME/.vimrc
