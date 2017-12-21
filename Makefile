SHELL := /bin/bash
DOCKER := $(shell command -v docker)

i ?= base

.PHONY: build
build:
ifndef DOCKER
	$(error Must have docker installed)
else
	docker build -t kklipsch/devenv:$(i) -f Dockerfile.$(i) . 
endif
