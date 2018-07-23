#!/bin/sh

ARCH=amd64
DISTRIBUTION=xenial

if [ -z ${DOCKER_TAG} ]; then
	DOCKER_TAG=":latest"
else
	[ ${DOCKER_TAG:0:1} =  ":" ] || DOCKER_TAG=":${DOCKER_TAG}"
fi

docker build -t odroid/${ARCH}-${DISTRIBUTION}${DOCKER_TAG} .
