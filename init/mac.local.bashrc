source $HOME/.devenv/hostrc

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

testlocalmachost() {
	LOCAL_STATE=${1:-~/.localmachost}
	LOCAL_PORT=2244
	CONTAINER_NAME=localmachost

	IP=`docker inspect --format '{{(index (index .NetworkSettings.Ports "22/tcp") 0).HostIp }}' ${CONTAINER_NAME}`

	ssh -v -f -o "UserKnownHostsFile=${LOCAL_STATE}/known_hosts" -A -p ${LOCAL_PORT} root@${IP} ssh -T git@github.com
}

stoplocalmachost() {
	docker stop localmachost
	docker rm localmachost
}

devenv() { 
	TAG=${1:-base}
	LOCAL_STATE=${2:-~/.localmachost}

	localmachost $LOCAL_STATE

	#load the ssh containers agent and pass it through to devenv
	AGENT=`cat ${LOCAL_STATE}/agent_socket_path | sed -e 's,/tmp/,,g'`
	docker run --rm -ti -v /var/run/docker.sock:/var/run/docker.sock -v ${LOCAL_STATE}/$AGENT:/tmp/ssh-agent.sock --env SSH_AUTH_SOCK=/tmp/ssh-agent.sock -v ${PWD}:/root/$(basename $PWD) kklipsch/devenv:$TAG; 
}
