FROM henne90gen/clang:15

# make sure GTKMM_VERSION is compatible with libgtk-4-dev provided by the debian package repository
# see https://packages.debian.org/search?searchon=names&keywords=libgtk-4-dev
ARG GTKMM_VERSION=4.8
ENV GTKMM_VERSION=${GTKMM_VERSION}

# make sure CAIRO_VERSION is compatible with libcairo2-dev provided by the debian package repository
# see https://packages.debian.org/search?searchon=names&keywords=libcairo2-dev
ARG CAIROMM_VERSION=1.16.2
ENV CAIROMM_VERSION=${CAIROMM_VERSION}

RUN apt-get install -y libgtk-4-dev libcairo2-dev wget git python3-pip python3-packaging libsigc++-3.0-dev && \
    pip3 install meson --break-system-packages && \
    apt-get install -y doxygen graphviz xsltproc m4 mm-common libxml-parser-perl && \
    wget -q https://www.cairographics.org/releases/cairomm-${CAIROMM_VERSION}.tar.xz && tar -xf cairomm-${CAIROMM_VERSION}.tar.xz && \
    cd cairomm-${CAIROMM_VERSION} && \
    meson setup --libdir lib _build . && \
    cd _build && \
    ninja install && \
    cd ../.. && \
    rm -rf cairomm-${CAIROMM_VERSION} cairomm-${CAIROMM_VERSION}.tar.xz && \
    wget -q https://download.gnome.org/sources/gtkmm/${GTKMM_VERSION}/gtkmm-${GTKMM_VERSION}.0.tar.xz && tar -xf gtkmm-${GTKMM_VERSION}.0.tar.xz && \
    cd gtkmm-${GTKMM_VERSION}.0 && \
    meson --libdir lib _build . && \
    cd _build && \
    ninja install && \
    cd ../.. && \
    rm -rf gtkmm-${GTKMM_VERSION}.0 gtkmm-${GTKMM_VERSION}.0.tar.xz && \
    pip3 uninstall -y meson --break-system-packages && \
    apt-get purge -y doxygen graphviz wget python3-pip && \
    apt-get autoremove -y
