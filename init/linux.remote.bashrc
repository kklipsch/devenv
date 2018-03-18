source $HOME/.devenv/hostrc
source $HOME/.devenv/linuxrc

export LOCATION=remote

devenv() { 
	TAG=${1:-base}
	
	DATAVOLUME=${DATAVOLUME:=~/devenv/data}
	PROJECTVOLUME=${PROJECTVOLUME:=~/devenv/projects}

	IMAGE_NAME=kklipsch/devenv:$TAG
	CONTAINER_NAME=devenv-$TAG

	docker pull $IMAGE_NAME 

	docker run --rm -ti -e DEVENT=$TAG -v $DATAVOLUME:/root/data -v $PROJECTVOLUME:/root/projects -v /var/run/docker.sock:/var/run/docker.sock -v $SSH_AUTH_SOCK:/tmp/ssh-agent.sock --env SSH_AUTH_SOCK=/tmp/ssh-agent.sock --name $CONTAINER_NAME $IMAGE_NAME; 
}
