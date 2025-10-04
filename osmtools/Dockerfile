FROM alpine:3.22.1 AS build-image

ENV OSM2PGSQL_INSTALL_DIR=/osm2pgsql-install
ENV OSMCTOOLS_INSTALL_DIR=/osmctools-install

# Install osm2pgsql
RUN apk add --no-cache \
    cmake \
    make \
    g++ \
    nlohmann-json \
    postgresql-dev \
    boost-dev \
    expat-dev \
    bzip2-dev \
    zlib-dev \
    libpq \
    proj-dev \
    lua5.3-dev \
    luajit-dev \
    ninja-build \
    git

RUN git clone https://github.com/osm2pgsql-dev/osm2pgsql.git
RUN cd /osm2pgsql && \
    mkdir build && \
    cd build && \
    cmake .. -D WITH_LUAJIT=ON -D CMAKE_INSTALL_PREFIX=${OSM2PGSQL_INSTALL_DIR} && \
    make install -j8

# Install osmctools
RUN apk add --no-cache git autoconf automake make g++ zlib-dev
RUN git clone https://github.com/ramunasd/osmctools.git
RUN cd osmctools && \
    autoreconf --install && \
    CFLAGS="-Wno-int-conversion" ./configure --prefix=${OSMCTOOLS_INSTALL_DIR} && \
    make && \
    make install -j8

FROM alpine:3.22.1

# osmconvert, osmfilter
RUN apk add --no-cache lua-inspect
COPY --from=build-image /osmctools-install /usr/local
COPY --from=build-image /osmctools-install /osmctools-install

# osm2pgsql
RUN apk add --no-cache \
    libpq \
    libexpat \
    libbz2 \
    proj \
    luajit \
    libstdc++ \
    libgcc
COPY --from=build-image /osm2pgsql-install /usr/local
COPY --from=build-image /osm2pgsql-install /osm2pgsql-install
