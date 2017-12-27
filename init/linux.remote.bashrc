source $HOME/.devenv/hostrc
source $HOME/.devenv/linuxrc

devenv() { 
	TAG=${1:-base}
	
	DATAVOLUME=${DATAVOLUME:=~/devenv/data}
	PROJECTVOLUME=${PROJECTVOLUME:=~/devenv/projects}

	docker run --rm -ti -v $DATAVOLUME:/root/data -v $PROJECTVOLUME:/root/projects -v /var/run/docker.sock:/var/run/docker.sock -v $SSH_AUTH_SOCK:/tmp/ssh-agent.sock --env SSH_AUTH_SOCK=/tmp/ssh-agent.sock kklipsch/devenv:$TAG; 
}
