#!/bin/sh

set -e

cat /banner.txt

SIZE=$(du -bsh /volume | cut -d/ -f1 | xargs)

echo
echo "We're gonna pack an estimate of $SIZE. Please be patient..."
echo

set -x

tar c -f /backup/${ARCHIVE_NAME}.tar -C /volume .
pigz /backup/${ARCHIVE_NAME}.tar
chown ${UID}:${GID} /backup/${ARCHIVE_NAME}.tar.gz

set +x

echo
echo "We're done here."
echo
