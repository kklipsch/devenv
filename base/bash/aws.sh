alias aws='docker run --rm -t $(tty &>/dev/null && echo "-i") -v "/$HOME/.aws:/root/.aws" -v "$(pwd):/project" mesosphere/aws-cli'

function awsconfig() {
	vault=$1

	rm -rf $HOME/.aws
	mkdir -p $HOME/.aws
	op get document  aws_credentials --vault=$vault > $HOME/.aws/credentials 
	op get document  aws_config --vault=$vault > $HOME/.aws/config
}
