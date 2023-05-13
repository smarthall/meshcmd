#!/bin/bash

set -euo pipefail

if [ ! -d build ]; then
    mkdir build
fi

wget https://meshcentral.com/meshagents?meshcmd=6 -O build/meshcmd

chmod +x build/meshcmd

export VERSION="$(./build/meshcmd | grep 'MeshCentral Command (MeshCmd)' | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+')"

echo "Packaging version ${VERSION}"

docker build . -t ghcr.io/smarthall/meshcmd:${VERSION}
