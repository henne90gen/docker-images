FROM henne90gen/clang:14 AS build

RUN apt-get install -y libgtk-4-dev wget git python3-pip libsigc++-3.0-dev && \
    pip3 install meson && \
    apt-get install -y \
    doxygen \
    graphviz \
    xsltproc \
    m4 \
    mm-common \
    libxml-parser-perl && \
    wget -q https://www.cairographics.org/releases/cairomm-1.16.2.tar.xz && tar -xf cairomm-1.16.2.tar.xz && \
    cd cairomm-1.16.2 && \
    meson --libdir lib _build . && \
    cd _build && \
    ninja install && \
    cd ../.. && \
    rm -rf cairomm-1.16.2 cairomm-1.16.2.tar.xz && \
    wget -q https://download.gnome.org/sources/gtkmm/4.8/gtkmm-4.8.0.tar.xz && tar -xf gtkmm-4.8.0.tar.xz && \
    cd gtkmm-4.8.0 && \
    meson --libdir lib _build . && \
    cd _build && \
    ninja install && \
    cd ../.. && \
    rm -rf gtkmm-4.8.0 gtkmm-4.8.0.tar.xz && \
    pip3 uninstall -y meson && \
    apt-get purge -y doxygen graphviz wget python3-pip && \
    apt-get autoremove -y

# RUN wget -q https://www.cairographics.org/releases/cairomm-1.16.2.tar.xz && tar -xf cairomm-1.16.2.tar.xz
# RUN cd cairomm-1.16.2 && \
#     meson --libdir lib _build .
# RUN cd cairomm-1.16.2/_build && \
#     ninja install

# RUN wget -q https://download.gnome.org/sources/gtkmm/4.8/gtkmm-4.8.0.tar.xz && tar -xf gtkmm-4.8.0.tar.xz
# RUN cd gtkmm-4.8.0 && \
#     meson --libdir lib _build .
# RUN cd gtkmm-4.8.0/_build && \
#     ninja install

# 2.68GB
# 1.98GB
# 1.78GB
