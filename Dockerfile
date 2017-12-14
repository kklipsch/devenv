FROM debian:stable

ENV USER=kklipsch
ENV HOME /home/$USER

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get -y install apt-utils sudo locales

RUN \
    dpkg-reconfigure -f noninteractive tzdata && \
    echo 'en_US.UTF-8 UTF-8' >/etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8

ADD scripts/* /usr/local/bin/

RUN user.sh "$USER" "$HOME"
RUN vim.sh

WORKDIR $HOME
USER $USER

ENTRYPOINT ["/bin/bash"]
