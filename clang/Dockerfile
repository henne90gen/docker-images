FROM debian:bookworm-20240812-slim

ARG LLVM_VERSION=18
ENV LLVM_VERSION=${LLVM_VERSION}

RUN apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y cmake ninja-build git wget lsb-release software-properties-common gnupg apt-transport-https ca-certificates && \
    wget -q https://apt.llvm.org/llvm.sh && \
    chmod +x llvm.sh && \
    ./llvm.sh $LLVM_VERSION && \
    rm llvm.sh && \
    apt-get install -y libomp-$LLVM_VERSION-dev libc++-$LLVM_VERSION-dev && \
    apt-get purge -y wget lsb-release software-properties-common gnupg apt-transport-https && \
    apt-get autoremove -y && \
    ln -s /usr/bin/clang-$LLVM_VERSION /usr/bin/clang && \
    ln -s /usr/bin/clang++-$LLVM_VERSION /usr/bin/clang++ && \
    rm -f /usr/bin/cc && ln -s /usr/bin/clang-$LLVM_VERSION /usr/bin/cc && \
    rm -f /usr/bin/c++ && ln -s /usr/bin/clang++-$LLVM_VERSION /usr/bin/c++
