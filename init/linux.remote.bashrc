source $HOME/.devenv/hostrc
source $HOME/.devenv/linuxrc

export LOCATION=remote

devenv() { 
	TAG=${1:-base}
	
	DEVENV_VOLUME=${DEVENV_VOLUME:=~/devenv}

	IMAGE_NAME=kklipsch/devenv:$TAG
	CONTAINER_NAME=devenv-$TAG

	docker pull $IMAGE_NAME 

	docker run --rm -ti -e DEVENV=$TAG -e DEVENV_VOLUME=$DEVENV_VOLUME -v $DEVENV_VOLUME:$DEVENV_VOLUME -v /var/run/docker.sock:/var/run/docker.sock -v $SSH_AUTH_SOCK:/tmp/ssh-agent.sock --env SSH_AUTH_SOCK=/tmp/ssh-agent.sock --name $CONTAINER_NAME $IMAGE_NAME; 
}
