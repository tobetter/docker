FROM rycus86/arm64v8-debian-qemu

LABEL version="1.0"
LABEL description="First"

RUN apt-get update
RUN apt-get install -y bash-completion build-essential curl git vim
RUN apt-get install -y asciidoc-base bc bison cpio debhelper devscripts dh-exec fakeroot flex graphviz kernel-wedge kmod libaudit-dev libbabeltrace-dev libdw-dev libelf-dev libglib2.0-dev libiberty-dev libnewt-dev libnuma-dev libpci-dev libperl-dev libssl-dev:native libudev-dev libunwind8-dev libwrap0-dev lintian python-dev python-sphinx python-sphinx-rtd-theme quilt xmlto

RUN rm -rf /var/lib/apt/lists/*
