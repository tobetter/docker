FROM amd64/ubuntu:16.04

MAINTAINER Dongjin Kim <tobetter@gmail.com>

RUN dpkg --add-architecture i386

ENV TERM=xterm

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y \
	libc6:i386 \
	libstdc++6:i386 \
	zlib1g:i386 \
	bash-completion \
	bc \
	build-essential \
	cpio \
	git \
	python \
	sudo \
	unzip \
	vim \
	wget \
	xz-utils

RUN sed -i '/Debian-exim/d' /var/lib/dpkg/statoverride
RUN echo "dash dash/sh boolean false" | debconf-set-selections && \
	dpkg-reconfigure -p critical dash

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /opt/toolchains

RUN wget https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/aarch64-linux-gnu/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz -P /tmp
RUN tar xJvf /tmp/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz -C /opt/toolchains

RUN wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz -P /tmp
RUN tar xJvf /tmp/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz -C /opt/toolchains

RUN wget https://releases.linaro.org/archive/14.04/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2014.04_linux.tar.xz -P /tmp
RUN tar xJvf /tmp/gcc-linaro-arm-none-eabi-4.8-2014.04_linux.tar.xz -C /opt/toolchains

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2 -P /tmp
RUN tar xjvf /tmp/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2 -C /opt/toolchains

RUN rm -rf /tmp/*.xz /tmp/*.bz2

ENV PATH=/opt/toolchains/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu/bin:/opt/toolchains/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:/opt/toolchains/gcc-linaro-arm-none-eabi-4.8-2014.04_linux/bin:$PATH

ENV ARCH arm64
ENV CROSS_COMPILE aarch64-linux-gnu-

RUN useradd -d /home/odroid -ms /bin/bash -g root -G sudo -p odroid odroid
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER odroid

WORKDIR /srv
