FROM debian:stable

ENV USER=kklipsch
ENV HOME /root
ENV DEVENV set-DEVENV-variable
ENV SHELL=/bin/bash
ENV VIMPACKAGES=$HOME/.vim/pack/$USER

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get -y install \
	apt-utils locales apt-transport-https ca-certificates software-properties-common\
	man-db less vim silversearcher-ag \
	git tig mercurial \
	curl wget\ 
	gnupg2 \
	tmux 

RUN \
    dpkg-reconfigure -f noninteractive tzdata && \
    echo 'en_US.UTF-8 UTF-8' >/etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8

ADD scripts/* /usr/local/bin/

WORKDIR $HOME

#variable expansion not supported yet
ADD tmux $HOME/.tmux
ADD bash $HOME/.bash
ADD vim $HOME/.vim

RUN rm -f $HOME/.bashrc && ln -s $HOME/.bash/base.sh $HOME/.bashrc
RUN rm -f $HOME/.vimrc && ln -s $HOME/.vim/base.vimrc $HOME/.vimrc
RUN ln -s $HOME/.bash/dircolors $HOME/.dircolors
RUN ln -s $HOME/.tmux/tmux.conf $HOME/.tmux.conf

RUN git.sh
RUN vim.sh
RUN docker.sh
RUN mkdir -p $HOME/.ssh && ssh-keyscan github.com >> $HOME/.ssh/known_hosts

VOLUME ["/root/data"]
VOLUME ["/root/projects"]

CMD ["tmux"]
