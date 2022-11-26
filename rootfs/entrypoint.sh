#!/bin/sh

tar c -f /backup/${ARCHIVE_NAME}.tar -C /volume .
pigz /backup/${ARCHIVE_NAME}.tar
chown ${UID}:${GID} /backup/${ARCHIVE_NAME}.tar.gz
