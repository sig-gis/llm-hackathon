# Define variables
IMAGENAME := nwgiebink/llm-dev:25.04.08
DOCKERFILE := docker/Dockerfile
CONTAINER ?= llm_dev
WORKDIR := /opt/llm-hackathon/
CODE_PATH := $(shell pwd)
LOGS_DIR ?= /opt/logs/
PORT ?= 8080
SHM_GB ?= 60

.PHONY: build pull start run clean attach

build:
	docker build -t $(IMAGENAME) -f $(DOCKERFILE) .

pull:
	docker pull $(IMAGENAME)

clean:
	@echo "Checking if container $(CONTAINER) exists and needs to be removed..."
	@docker rm -f $(CONTAINER) 2>/dev/null || echo "Container $(CONTAINER) may not exist or an error occurred during removal."

start: clean
	docker run --gpus all -it -d --shm-size=$(SHM_GB)gb \
		-v $(CODE_PATH):$(WORKDIR) \
		-v $(LOGS_DIR):/opt/logs/ \
		-w $(WORKDIR) \
		-p $(PORT):$(PORT) \
		--name $(CONTAINER) $(IMAGENAME) 

attach:
	@echo "Attempting to attach to container $(CONTAINER)..."
	@docker attach $(CONTAINER) || { \
		echo "Container $(CONTAINER) may not be running. Attempting to start..."; \
		docker start $(CONTAINER) && docker attach $(CONTAINER) || \
		echo "Failed to attach: container $(CONTAINER) may not exist or an error occurred."; \
	}

run: clean start attach