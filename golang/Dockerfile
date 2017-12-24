FROM kklipsch/devenv:base 

#non-inline go src
VOLUME ["/root/src"]

ADD scripts/* /usr/local/bin/
ADD bash $HOME/.bash
ADD vim $HOME/.vim

WORKDIR $HOME
RUN goinstall.sh
RUN gotools.sh
RUN rm -f $HOME/.bashrc && ln -s $HOME/.bash/go.sh $HOME/.bashrc
RUN rm -f $HOME/.vimrc && ln -s $HOME/.vim/go.vimrc $HOME/.vimrc
