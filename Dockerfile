FROM alpine

RUN apk add --no-cache pigz

ADD rootfs /

ENV UID=1000
ENV GID=1000
ENV ARCHIVE_NAME=volume

VOLUME /backup /volume

ENTRYPOINT /entrypoint.sh
