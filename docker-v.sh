#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
command -v docker >/dev/null 2>&1 || { echo >&2 "docker not found. Aborting"; exit 1; }
VER="$(docker -v|cut -d',' -f1|awk '{print $3}')"
sed -i -E "s/ENV DOCKER_VERSION.*/ENV DOCKER_VERSION $VER/g" $DIR/Dockerfile