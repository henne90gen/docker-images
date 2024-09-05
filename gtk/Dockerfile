FROM henne90gen/clang:18

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y wget git python3-pip python3-packaging

RUN pip3 install meson --break-system-packages
RUN apt-get install -y pkg-config libglib2.0-dev libcairo2-dev libxkbcommon-dev libwayland-dev libxrandr-dev libxi-dev libxcursor-dev libxdamage-dev libxinerama-dev libvulkan-dev glslc libdrm-dev libgles2-mesa-dev  libgirepository1.0-dev

ARG GTK_VERSION=4.15.6
ENV GTK_VERSION=${GTK_VERSION}
RUN wget -q https://download.gnome.org/sources/gtk/4.15/gtk-$GTK_VERSION.tar.xz
RUN tar -xf gtk-$GTK_VERSION.tar.xz
RUN cd gtk-$GTK_VERSION && \
    meson setup --libdir lib . _build \
        -D media-gstreamer=disabled \
        -D introspection=enabled \
        -D build-demos=false \
        -D build-tests=false \
        -D build-testsuite=false \
        -D build-examples=false && \
    cd _build && \
    ninja install

ARG ADWAITA_VERSION=1.5.3
ENV ADWAITA_VERSION=${ADWAITA_VERSION}
RUN wget -q https://download.gnome.org/sources/libadwaita/1.5/libadwaita-$ADWAITA_VERSION.tar.xz
RUN tar -xf libadwaita-$ADWAITA_VERSION.tar.xz
RUN apt-get install -y libcurl4-openssl-dev libyaml-dev libzstd-dev gperf gettext itstool xsltproc docbook-xsl valac
RUN cd libadwaita-$ADWAITA_VERSION && \
    meson setup --prefix=/usr --libdir lib . _build \
        -D examples=false \
        -D tests=false && \
    cd _build && \
    ninja install
