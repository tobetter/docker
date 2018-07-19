FROM arm64v8/debian:stretch

MAINTAINER "Dongjin Kim <tobetter@gmail.com>"

ADD qemu-aarch64-static /usr/bin

ENV TERM xterm

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LANG C.UTF-8

RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
	sudo \
	vim \
	bash-completion

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN sed -i '/Debian-exim/d' /var/lib/dpkg/statoverride
RUN echo "dash dash/sh boolean false" | debconf-set-selections &&     dpkg-reconfigure -p critical dash

RUN adduser --disabled-password --gecos '' odroid
RUN adduser odroid sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER odroid

WORKDIR /srv
