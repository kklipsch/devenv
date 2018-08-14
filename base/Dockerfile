FROM debian:stable

ENV USER=kklipsch
ENV HOME /home
ENV DEVENV set-DEVENV-variable
ENV SHELL=/bin/bash
ENV VIMPACKAGES=$HOME/.vim/pack/$USER

# this volume is for storing session state on the host, things like docker creditions, aws configs etc
VOLUME /state

# note that the host script will also load the host wd as a volume

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get -y install \
	apt-utils locales apt-transport-https ca-certificates software-properties-common\
	man-db less vim silversearcher-ag zip unzip \
	git tig mercurial \
	curl wget\ 
	gnupg2 \
	jq \
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

ADD tmux $HOME/.tmux
ADD bash $HOME/.bash
ADD vim $HOME/.vim
ADD ssh $HOME/.ssh

RUN rm -f $HOME/.bashrc && ln -s $HOME/.bash/base.sh $HOME/.bashrc
#tmux seems to prefer profile
RUN rm -f $HOME/.profile && ln -s $HOME/.bash/base.sh $HOME/.profile
RUN rm -f $HOME/.vimrc && ln -s $HOME/.vim/base.vimrc $HOME/.vimrc
RUN ln -s $HOME/.bash/dircolors $HOME/.dircolors
RUN ln -s $HOME/.tmux/tmux.conf $HOME/.tmux.conf

RUN git.sh
RUN vim.sh
RUN docker.sh
RUN op.sh
RUN ssh-keyscan github.com >> $HOME/.ssh/known_hosts

ENTRYPOINT (cd $DEVENV_VOLUME; tmux)
