FROM kklipsch/devenv:base 

ADD scripts/* /usr/local/bin/
ADD bash $HOME/.bash
ADD vim $HOME/.vim

WORKDIR $HOME
RUN jvminstall.sh
RUN jvmtools.sh
RUN rm -f $HOME/.bashrc && ln -s $HOME/.bash/jvm.sh $HOME/.bashrc
RUN rm -f $HOME/.vimrc && ln -s $HOME/.vim/jvm.vimrc $HOME/.vimrc
