alias aws='docker run --rm -t $(tty &>/dev/null && echo "-i") -v "$DEVENV_VOLUME/data/aws:/root/.aws" -v "$(pwd):/project" mesosphere/aws-cli'

function awsconfig() {
	vault=$1

	rm -rf $DEVENV_VOLUME/data/aws
	mkdir -p $DEVENV_VOLUME/data/aws
	op get document  aws_credentials --vault=$vault > $DEVENV_VOLUME/data/aws/credentials 
	op get document  aws_config --vault=$vault > $DEVENV_VOLUME/data/aws/config
}
