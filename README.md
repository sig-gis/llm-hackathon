# llm-hackathon
LLM pilot projects

# Environment
This repo includes the recipe for a custom docker image with dependencies for a general ML/NLP/web scraping and langchain-based LLM development environment in python. It is not necessary to rebuild the image -- just pull it from dockerhub and spin it up. 

## Prerequisites (Ubuntu)
- [Install Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)

- [Install NVIDIA Drivers](https://documentation.ubuntu.com/server/how-to/graphics/install-nvidia-drivers/index.html) 

- [Install NVIDIA container toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

## Environment setup
You can use native docker commands but this repo also includes a makefile `docker.mk` for convenience.

Pull the docker image from dockerhub:
```
make -f docker.mk pull
```

Run container in an interactive bash environment:
```
make -f docker.mk run
```
