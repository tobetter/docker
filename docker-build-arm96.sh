#!/bin/bash

function docker_minimal {
	ARCH=$1
	DIST=$2
	DESTDIR=$3

	case "${ARCH}" in
		arm32v7)
			QEMU_BINARY=qemu-arm-static
			;;
		arm64v8)
			QEMU_BINARY=qemu-aarch64-static
			;;
		*)
			QEMU_BINARY=qemu-$1-static
			;;
	esac
	case "${DIST}" in
		jessie | stretch | buster | sid)
			DISTRIBUTION=debian
			;;
		xenial | artful | bionic)
			DISTRIBUTION=ubuntu
			;;
		*)
			echo "Unknow distribtion "$2
			exit 1
			;;
	esac

	cp -a ${QEMU_BINARY} ${DESTDIR}/

	cat>${DESTDIR}/Dockerfile<<__EOF
FROM ${ARCH}/${DISTRIBUTION}:${DIST}

MAINTAINER "Dongjin Kim <tobetter@gmail.com>"

ADD ${QEMU_BINARY} /usr/bin

ENV TERM xterm

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LANG C.UTF-8

RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \\
	sudo \\
	vim \\
	bash-completion

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN sed -i '/Debian-exim/d' /var/lib/dpkg/statoverride
RUN echo "dash dash/sh boolean false" | debconf-set-selections && \
    dpkg-reconfigure -p critical dash

RUN adduser --disabled-password --gecos '' odroid
RUN adduser odroid sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER odroid

WORKDIR /srv
__EOF
}

function docker_debuild {
	ARCH=$1
	DIST=$2
	DESTDIR=$3

	cat>${DESTDIR}/Dockerfile<<__EOF
FROM odroid/${ARCH}-${DIST}-minimal

MAINTAINER "Dongjin Kim <tobetter@gmail.com>"

USER root

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \\
	asciidoc-base \\
	bc \\
	bf-utf-source \\
	bison \\
	build-essential \\
	cpio \\
	debhelper \\
	debian-archive-keyring \\
	debiandoc-sgml \\
	devscripts \\
	dh-di \\
	dh-exec \\
	dh-python \\
	docbook-xml \\
	docbook-xsl \\
	dosfstools \\
	equivs \\
	fakeroot \\
	flex \\
	genext2fs \\
	genisoimage \\
	git \\
	graphviz \\
	isolinux \\
	kernel-wedge \\
	kmod \\
	libdistro-info-perl \\
	libnewt-pic \\
	librsvg2-bin \\
	libslang2-pic \\
	lintian \\
	lsb-release \\
	mklibs \\
	mklibs-copy \\
	mtools \\
	pxelinux \\
	python-sphinx \\
	python-sphinx-rtd-theme \\
	quilt \\
	tofrodos \\
	u-boot-tools \\
	wget \\
	xmlto \\
	xorriso \\
	xsltproc

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN sed -i '/Debian-exim/d' /var/lib/dpkg/statoverride

RUN echo 'jenkins ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER odroid
__EOF
}

ARCH_TYPES="arm32v7 arm64v8"
DISTRIBUTIONS="jessie stretch buster sid xenial bionic artful"

for arch in ${ARCH_TYPES}; do
	for d in ${DISTRIBUTIONS}; do
		destdir=${PWD}/${arch}/${d}/minimal
		mkdir -p ${destdir}
		docker_minimal ${arch} ${d} ${destdir}

		destdir=${PWD}/${arch}/${d}/debian
		mkdir -p ${destdir}
		docker_debuild ${arch} ${d} ${destdir}
	done
done

taglist=""

for arch in ${ARCH_TYPES}; do
	for d in ${DISTRIBUTIONS}; do
		destdir=${PWD}/${arch}/${d}/minimal
		tagname="odroid/${arch}-${d}-minimal:latest"
		taglist="${taglist} ${tagname}"
		docker build -t ${tagname} ${destdir}

		destdir=${PWD}/${arch}/${d}/debian
		tagname="odroid/${arch}-${d}-debuild:latest"
		taglist="${taglist} ${tagname}"
		docker build -t ${tagname} ${destdir}
	done
done


cat>docker_push.sh<<__EOF
!/bin/sh

taglist="${taglist}"

for i in \${taglist}; do
	docker push \${i}:latest
done
__EOF
