FROM debian:bookworm-20221114-slim

RUN apt-get update -y && \
    apt-get install -y cmake ninja-build git wget lsb-release software-properties-common gnupg apt-transport-https ca-certificates libomp-dev && \
    wget -q https://apt.llvm.org/llvm.sh && \
    chmod +x llvm.sh && \
    ./llvm.sh 14 && \
    rm llvm.sh && \
    apt-get purge -y wget lsb-release software-properties-common gnupg apt-transport-https && \
    apt-get autoremove -y && \
    ln -s /usr/bin/clang-14 /usr/bin/clang && \
    ln -s /usr/bin/clang++-14 /usr/bin/clang++ && \
    rm -f /usr/bin/cc && ln -s /usr/bin/clang-14 /usr/bin/cc && \
    rm -f /usr/bin/c++ && ln -s /usr/bin/clang++-14 /usr/bin/c++
