FROM alpine:3.12.7
# version 3.13.x is missing apr-util-dbm_db

ENV LANG en_US.utf8
ENV APACHE_SERVER_NAME localhost
ENV WWW_DATA_UID 33
ENV WWW_DATA_GID 33

RUN apk add --update \
        curl \
        bash \
        apache2-webdav \
        apache2-ctl \
        apr-util \
        apr-util-dbm_db \
        linux-pam \
        && \
    curl -Ls -o /tmp/s6-overlay.tar.gz https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-amd64.tar.gz \
    && tar xfz /tmp/s6-overlay.tar.gz -C / \
    && rm -f /tmp/s6-overlay.tar.gz \
    && deluser xfs \
    && delgroup www-data \
    && apk del curl \
    && rm -rfv /var/cache/apk/*
ADD files /
ENTRYPOINT ["/init"]
EXPOSE 80
