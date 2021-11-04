FROM debian:bullseye-20211011-slim

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y wget lsb-release software-properties-common gnupg apt-transport-https ca-certificates git && \
    wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && ./llvm.sh 13 && \
    apt-get install -y \
        cmake \
        clang-tools-13 \
        clang-13-doc \
        libclang-13-dev \
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
    wget https://download.gnome.org/sources/gtk/4.4/gtk-4.4.0.tar.xz && tar -xvf gtk-4.4.0.tar.xz && \
    cd gtk-4.4.0 && meson _build . && cd _build && ninja install && \
    wget https://download.gnome.org/sources/gtkmm/4.4/gtkmm-4.4.0.tar.xz && tar -xvf gtkmm-4.4.0.tar.xz && \
    apt-get install -y doxygen graphviz xsltproc m4 mm-common libcairomm-1.0-dev libxml-parser-perl && \
    cd gtkmm-4.4.0 && meson --libdir lib _build . && cd _build && ninja install
