FROM henne90gen/clang:13 AS build

RUN apt-get install -y libgtk-4-dev wget git python3-pip
RUN pip3 install meson

RUN wget -q https://download.gnome.org/sources/gtkmm/4.4/gtkmm-4.4.0.tar.xz && tar -xf gtkmm-4.4.0.tar.xz
RUN apt-get install -y \
    doxygen \
    graphviz \
    xsltproc \
    m4 \
    mm-common \
    libcairomm-1.0-dev \
    libxml-parser-perl && \
    cd gtkmm-4.4.0 && \
    meson --libdir lib _build . && \
    cd _build && \
    ninja install \
    cd ../.. && \
    rm -rf gtkmm-4.4.0 gtkmm-4.4.0.tar.xz \
    apt-get uninstall -y doxygen graphviz
