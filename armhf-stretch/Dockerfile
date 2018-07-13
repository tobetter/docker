FROM arm32v7/debian:stretch

MAINTAINER "Dongjin Kim <tobetter@gmail.com>"

ADD qemu-arm-static /usr/bin

ENV DEBIAN_FRONTEND noninteractive
ENV TERM=term-256color

RUN apt-get update && \
	apt-get install -y --no-install-recommends apt-utils && \
	apt-get install -y build-essential bc bison flex \
		bf-utf-source \
		cpio \
		debiandoc-sgml \
		devscripts \
		docbook-xml \
		docbook-xsl \
		dosfstools \
		genext2fs \
		genisoimage \
		kmod \
		libbogl-dev \
		libnewt-pic \
		libslang2-pic  \
		libssl-dev \
		lintian \
		mklibs \
		mklibs-copy \
		mtools \
		u-boot-tools  \
		wget \
		xorriso \
		xsltproc

RUN useradd -d /home/odroid -ms /bin/bash -g root -G sudo -p odroid odroid

USER odroid

WORKDIR /home/odroid
