FROM arm64v8/ubuntu:21.04

MAINTAINER Dongjin Kim <tobetter@gmail.com>

ENV TERM xterm

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LANG C.UTF-8

RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends apt-utils
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
	apt-file \
	autopoint \
	bash-completion \
	bc \
	build-essential \
	cpio \
	device-tree-compiler \
	dosfstools \
	file \
	git \
	vim

RUN echo "dash dash/sh boolean false" | debconf-set-selections && \
	dpkg-reconfigure -p critical dash

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /srv
