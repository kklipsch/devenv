SHELL := /bin/bash
REPO := kklipsch/devenv

DOCKERDIRS = $(shell ls -d */)
IMAGES = $(shell basename -a $(DOCKERDIRS))

.PHONY: usage
usage:
	@grep -E '^[a-zA-Z_%-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

%.publish: %.image ## publish the docker images
	docker push $(REPO):$*

%.image: ## builds a docker image for a cmd
	docker build -t $(REPO):$* $*

%.local: %.image ## tags a docker build with a 'local' tag to make it easier to run
	docker tag $(REPO):$* $*

.PHONY: publish
publish: $(IMAGES:=.publish) ## publish the artifacts
	@echo "done publishing all"

.PHONY: package
package: $(IMAGES:=.image) ## build the artifacts
	@echo "done packaging all"


