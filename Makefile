SHELL := /bin/bash
DOCKER := $(shell command -v docker)

i ?= base

.PHONY: usage
usage:
	@echo usage:
	@echo make build i=golang

.PHONY: build
build:
ifndef DOCKER
	$(error Must have docker installed)
else
	docker build -t kklipsch/devenv:$(i) $(i) 
endif
