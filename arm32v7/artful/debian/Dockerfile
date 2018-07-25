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
	dh-python \
	docbook-xml \
	docbook-xsl \
	dosfstools \
	equivs \
	fakeroot \
	flex \
	genext2fs \
	genisoimage \
	git \
	graphviz \
	isolinux \
	kernel-wedge \
	kmod \
	libdistro-info-perl \
	libnewt-pic \
	librsvg2-bin \
	libslang2-pic \
	lintian \
	lsb-release \
	mklibs \
	mklibs-copy \
	mtools \
	pxelinux \
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
