FROM debian:bullseye-20211011-slim

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget lsb-release software-properties-common gnupg apt-transport-https ca-certificates && \
    wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && ./llvm.sh 13 && \
    apt-get install -y cmake clang-tools-13 clang-13-doc libclang-13-dev ninja-build
