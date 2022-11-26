#!/bin/sh

set -e

cat /banner.txt

set -x

tar c -f /backup/${ARCHIVE_NAME}.tar -C /volume .
pigz /backup/${ARCHIVE_NAME}.tar
chown ${UID}:${GID} /backup/${ARCHIVE_NAME}.tar.gz

set +x

echo
echo "We're done here."
echo
