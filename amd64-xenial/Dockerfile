FROM amd64/ubuntu:16.04

MAINTAINER Dongjin Kim <tobetter@gmail.com>

RUN dpkg --add-architecture i386

ENV DEBIAN_FRONTEND noninteractive
ENV TERM=term-256color

RUN apt-get update && \
	apt-get install -y libc6:i386 libstdc++6:i386 zlib1g:i386 && \
	apt-get install -y gcc build-essential cpio && \
	apt-get install -y git unzip python vim wget xz-utils bc

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
ENV ARCH=arm64
ENV CROSS_COMPILE=aarch64-linux-gnu-
ENV LANG=C

RUN useradd -d /home/odroid -ms /bin/bash -g root -G sudo -p odroid odroid

USER odroid

WORKDIR /home/odroid
