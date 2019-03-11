# As of the writing of this Dockerfile Docker For Mac did not support forwarding sockets or sharing usb keys
# with the docker containers it hosts.  This meant that my yubikey based ssh keys won't work as you can't
# read it directly in a container or forward agent to it.
#
# What this does is setup a sshd container, that you ssh into with agent forwarding on, it captures the 
# socket for that, and you can then mount that socket file to other containers. Container/container socker
# sharing appears to work. This is cribbed heavily from https://github.com/avsm/docker-ssh-agent-forward

FROM alpine

EXPOSE 22

RUN apk update && apk add openssh 

RUN mkdir /root/.ssh && \
    chmod 755 /root/.ssh && \
    ssh-keygen -A

RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

COPY yubikey.pub /root/.ssh/authorized_keys
RUN chmod 644 /root/.ssh/authorized_keys
COPY ssh-find-agent.sh /root/ssh-find-agent.sh

VOLUME ["/tmp"]

CMD ["/usr/sbin/sshd","-D"]
