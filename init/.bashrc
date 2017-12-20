# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
   #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\'
   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\][\t]\[\033[00m\] \[\033[01;36m\]\u\[\033[00m\]@\[\033[01;34m\]\h\[\033[00m\]\n\[\033[1;36m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Use vi mode on the shell
set -o vi
#
# Add a home bin to the path
PATH=$HOME/bin:$PATH

localmachost() {
	LOCAL_STATE=${1:-~/.localmachost}
	
	IMAGE_NAME=kklipsch/devenv:localmachost
	CONTAINER_NAME=localmachost
	LOCAL_PORT=2244

	#cleanup any previous runs
	docker rm -f ${CONTAINER_NAME} >/dev/null 2>&1 || true
	rm -rf ${LOCAL_STATE}
	mkdir -p ${LOCAL_STATE}

	#start the sshd docker container
	docker run  --name ${CONTAINER_NAME} \
	-v ${LOCAL_STATE}:/tmp \
	-d -p ${LOCAL_PORT}:22 ${IMAGE_NAME} 

	#set the known hosts file so that mess doesnt bother us (agent forwarding doesnt work during mitm detection!)
	IP=`docker inspect --format '{{(index (index .NetworkSettings.Ports "22/tcp") 0).HostIp }}' ${CONTAINER_NAME}`
	ssh-keyscan -p ${LOCAL_PORT} ${IP} > ${LOCAL_STATE}/known_hosts 2>/dev/null

	#ssh to the ssh container, forwarding the agent and storing auth sock on the container
	ssh -f -o "UserKnownHostsFile=${LOCAL_STATE}/known_hosts" -A -p ${LOCAL_PORT} root@${IP} /root/ssh-find-agent.sh
}

devenv() { 
	TAG=${1:-base}
	LOCAL_STATE=${2:-~/.localmachost}

	localmachost $LOCAL_STATE

	#load the ssh containers agent and pass it through to devenv
	AGENT=`cat ${LOCAL_STATE}/agent_socket_path | sed -e 's,/tmp/,,g'`
	docker run --rm -ti -v ${LOCAL_STATE}/$AGENT:/tmp/ssh-agent.sock --env SSH_AUTH_SOCK=/tmp/ssh-agent.sock -v ${PWD}:/home/kklipsch/$(basename $PWD) kklipsch/devenv:$TAG; 
}
