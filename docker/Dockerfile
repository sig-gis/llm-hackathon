# Use an official NVIDIA CUDA base image (with cuDNN) for GPU support
FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

# Set up timezone for logging and other purposes
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install system dependencies: Python3, pip, and other useful tools
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    wget \
    curl \
    git \
    unzip \
    software-properties-common \
    tmux \
    sqlite3 \
    libfontconfig1-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libxml2-dev \
    vim \
    jq \
    progress \
    rustc \
    cargo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Install Python packages for ML, NLP, and text scraping
# Including LangChain ecosystem tools and PyTorch with GPU support
RUN pip3 install \
    psutil \
    pypdf \
    jupyter \
    numpy \
    pandas \
    scikit-learn \
    matplotlib \
    aiohttp \
    boilerpy3 \
    typing_extensions \
    beautifulsoup4 \
    trafilatura \
    html5lib \
    libxml2-python3 \ 
    lxml \
    nltk \
    gensim \
    textblob \
    unstructured \
    langchain \
    langchain-text-splitters \
    langchain-openai \
    langchain-anthropic \
    langchain-huggingface \
    langchain_community \
    langchain-cli \
    faiss-cpu \
    sentence-transformers \
    transformers \
    torch \
    --extra-index-url https://download.pytorch.org/whl/cu117

# Add project directories to PYTHONPATH for in-house modules
ENV PYTHONPATH=${PYTHONPATH}:"/opt/llm-hackathon/:/opt/llm-hackathon/src/:/opt/llm-hackathon/scripts/"

# Set default command to start a bash shell
CMD ["/bin/bash"]
