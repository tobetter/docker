#!/bin/sh

ARCH=arm
DISTRIBUTION=stretch

if [ -z ${DOCKER_TAG} ]; then
	echo 'DOCKER_TAG' is missing, so using the current date YYYYMMDD
	DOCKER_TAG=":`date +%Y%m%d`"
else
	[ ${DOCKER_TAG:0:1} =  ":" ] || DOCKER_TAG=":${DOCKER_TAG}"
fi

[ "x`which qemu-${ARCH}-static`" = "x" ] && sudo apt-get install qemu-user-static

docker build -t odroid/${ARCH}-${DISTRIBUTION}${DOCKER_TAG} .
