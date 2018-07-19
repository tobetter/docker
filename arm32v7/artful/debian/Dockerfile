FROM odroid/arm32v7-artful-minimal

MAINTAINER "Dongjin Kim <tobetter@gmail.com>"

USER root

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
	asciidoc-base \
	bc \
	bf-utf-source \
	bison \
	build-essential \
	cpio \
	debhelper \
	debian-archive-keyring \
	debiandoc-sgml \
	devscripts \
	dh-di \
	dh-exec \
	docbook-xml \
	docbook-xsl \
	dosfstools \
	equivs \
	fakeroot \
	flex \
	genext2fs \
	genisoimage \
	graphviz \
	isolinux \
	kernel-wedge \
	kmod \
	libaudit-dev \
	libbabeltrace-dev \
	libbogl-dev \
	libdistro-info-perl \
	libdw-dev \
	libelf-dev \
	libglib2.0-dev \
	libiberty-dev \
	libnewt-dev \
	libnewt-pic \
	libpci-dev \
	libperl-dev \
	librsvg2-bin \
	libslang2-pic \
	libssl-dev:native \
	libudev-dev \
	libunwind8-dev \
	libwrap0-dev \
	lintian \
	lsb-release \
	mklibs \
	mklibs-copy \
	mtools \
	pxelinux \
	python-dev \
	python-sphinx \
	python-sphinx-rtd-theme \
	quilt \
	tofrodos \
	u-boot-tools \
	wget \
	xmlto \
	xorriso \
	xsltproc

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN sed -i '/Debian-exim/d' /var/lib/dpkg/statoverride

RUN echo 'jenkins ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER odroid
