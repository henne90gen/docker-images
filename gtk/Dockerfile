FROM henne90gen/clang:18

ARG GTK_VERSION=4.12.0
ENV GTK_VERSION=${GTK_VERSION}

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y wget git python3-pip python3-packaging
RUN wget -q https://download.gnome.org/sources/gtk/4.12/gtk-$GTK_VERSION.tar.xz
RUN tar -xf gtk-$GTK_VERSION.tar.xz
RUN pip3 install meson --break-system-packages
RUN apt-get install -y pkg-config libglib2.0-dev libcairo2-dev libxkbcommon-dev libwayland-dev libxrandr-dev libxi-dev libxcursor-dev libxdamage-dev libxinerama-dev libgstreamer-plugins-bad1.0-dev
RUN cd gtk-$GTK_VERSION && \
    meson setup --libdir lib . _build \
        -D build-demos=false \
        -D build-tests=false \
        -D build-testsuite=false \
        -D build-examples=false && \
    cd _build && \
    ninja install
