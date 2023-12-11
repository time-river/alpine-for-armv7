#!/bin/bash

PACKAGES="
	musl-utils gcompat libc-utils
	busybox busybox-binsh busybox-suid busybox-mdev-openrc busybox-openrc openrc kmod
	lsblk su-exec
	alpine-base alpine-release
	openssl ca-certificates ca-certificates-bundle
	htop file vim xxd wget
	i2c-tools v4l-utils
	iproute2 iw
	alpine-keys apk-tools
"

#	mkinitfs linux-virt
#--timezone 'UTC' \
sudo ./alpine-make-rootfs \
    --mirror-uri https://mirrors.tuna.tsinghua.edu.cn/alpine/	\
    --branch v3.19 \
    --no-default-pkgs --packages "$PACKAGES"	\
    --script-chroot \
    alpine-rootfs-$(date +%Y%m%d).tar.gz - <<'SHELL'
        # Copy some file from the repository root to the rootfs.

        sed -i 's/^root:x:0:0/root::0:0/g' /etc/passwd
        #echo -e '\nttyFIQ0::respawn:/sbin/getty -L ttyFIQ0 115200 vt100\n' >> /etc/inittab
        # Install some dev packages and gem mailcatcher.
        #apk add --no-progress -t .make build-base ruby-dev sqlite-dev

        # Clean-up dev packages.  (7)
        #apk del --no-progress .make
SHELL
