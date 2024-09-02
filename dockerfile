# Use a base image with a general purpose Linux distribution
FROM ubuntu:latest

# Set environment variables
ENV GO_VERSION=1.20.5

# Install necessary packages and dependencies
RUN apt-get update && \
    apt-get install -y wget tar && \
    wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm go${GO_VERSION}.linux-amd64.tar.gz && \
    ln -s /usr/local/go/bin/go /usr/bin/go && \
    go version

# Set up working directory
WORKDIR /workspace

# Default command
CMD ["bash"]
