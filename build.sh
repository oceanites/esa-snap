#!/bin/sh
set -euxo pipefail

SNAP_VERSION=13.0.0

# example: https://download.esa.int/step/snap/12.0/installers/esa-snap_all_linux-12.0.0.sh
# ${SNAP_VERSION//0.0/0} replaces "0.0" with "0" in $SNAP_VERSION. This removes the one trailing zero.
# download SNAP
wget --continue  "https://step.esa.int/downloads/${SNAP_VERSION//0.0/0}/installers/esa-snap_all_linux-${SNAP_VERSION}.sh"

docker build -t esa-snap${SNAP_VERSION//.0.0/} --build-arg SNAP_VERSION=$SNAP_VERSION .
