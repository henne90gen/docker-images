FROM node:26.1.0-bookworm

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y ca-certificates curl && \
    curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    rm get-docker.sh

# Install Go
RUN curl -fsSL https://go.dev/dl/go1.26.3.linux-amd64.tar.gz -o go.tar.gz && \
    tar -C /usr/local -xzf go.tar.gz && \
    rm go.tar.gz && \
    ln -s /usr/local/go/bin/go /usr/local/bin/go && \
    ln -s /usr/local/go/bin/gofmt /usr/local/bin/gofmt && \
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc

# Install Java
RUN apt-get install -y openjdk-17-jdk
