FROM debian:bullseye-20211011-slim

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y wget lsb-release software-properties-common gnupg apt-transport-https ca-certificates git && \
    wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && ./llvm.sh 12 && \
    apt-get install -y \
        cmake \
        clang-tools-12 \
        clang-12-doc \
        libclang-12-dev \
        ninja-build \
    python3-pip && \
    pip3 install meson && \
    apt-get install -y \
        pkg-config \
        libxkbcommon-dev \
        libcairo2-dev \
        libx11-dev \
        libwayland-dev \
        libxrandr-dev \
        libxi-dev \
        libxcursor-dev \
        libxcomposite-dev \
        libxdamage-dev \
        libxfixes-dev \
        libxrender-dev \
        libxext-dev \
        libxinerama-dev \
        libgstreamer-plugins-bad1.0-dev && \
    wget https://download.gnome.org/sources/gtk/4.5/gtk-4.5.0.tar.xz && tar -xvf gtk-4.5.0.tar.xz && \
    cd gtk-4.5.0 && meson _build . && cd _build && ninja install
