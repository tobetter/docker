FROM arm64v8/debian:stretch

MAINTAINER "Dongjin Kim <tobetter@gmail.com>"

ADD qemu-aarch64-static /usr/bin

ENV DEBIAN_FRONTEND noninteractive
ENV TERM=term-256color

RUN apt-get update && \
	apt-get install -y --no-install-recommends apt-utils && \
	apt-get install -y devscripts build-essential lintian && \
	apt-get install -y bc flex bison

RUN useradd -d /home/odroid -ms /bin/bash -g root -G sudo -p odroid odroid

USER odroid

WORKDIR /home/odroid
