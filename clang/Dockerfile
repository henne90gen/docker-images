FROM debian:bookworm-20211011-slim

RUN apt-get update -y
RUN apt-get install -y cmake ninja-build git wget lsb-release software-properties-common gnupg apt-transport-https ca-certificates && \
    wget -q https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && ./llvm.sh 13 && rm llvm.sh && \
    apt-get purge -y wget lsb-release software-properties-common gnupg apt-transport-https ca-certificates && \
    apt-get autoremove -y
RUN ln -s /usr/bin/clang-13 /usr/bin/clang
RUN ln -s /usr/bin/clang++-13 /usr/bin/clang++
