FROM debian:bookworm-20230227-slim

ARG LLVM_VERSION=15
ENV LLVM_VERSION=${LLVM_VERSION}

RUN apt-get update -y && \
    apt-get install -y cmake ninja-build git wget lsb-release software-properties-common gnupg apt-transport-https ca-certificates libomp-dev && \
    wget -q https://apt.llvm.org/llvm.sh && \
    chmod +x llvm.sh && \
    ./llvm.sh $LLVM_VERSION && \
    rm llvm.sh && \
    apt-get purge -y wget lsb-release software-properties-common gnupg apt-transport-https && \
    apt-get autoremove -y && \
    ln -s /usr/bin/clang-$LLVM_VERSION /usr/bin/clang && \
    ln -s /usr/bin/clang++-$LLVM_VERSION /usr/bin/clang++ && \
    rm -f /usr/bin/cc && ln -s /usr/bin/clang-$LLVM_VERSION /usr/bin/cc && \
    rm -f /usr/bin/c++ && ln -s /usr/bin/clang++-$LLVM_VERSION /usr/bin/c++
