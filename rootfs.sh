#!/bin/bash

export APK_TOOLS_URI=https://gitlab.alpinelinux.org/api/v4/projects/5/packages/generic//v2.14.0/armhf/apk.static
export APK_TOOLS_SHA256=878a000702c1faeb9fdab594dc071b5a1c40647646c96b07aa35dcd43247567a

PACKAGES="
	zlib libgcc
	openssl ca-certificates
	libdrm
	mtd-utils mmc-utils
	i2c-tools v4l-utils usbutils
	ethtool iproute2 iw
	apk-tools
	python3 py3-opencv
	vim htop
"

#--timezone 'UTC' \
sudo ./alpine-make-rootfs \
    --mirror-uri https://mirrors.tuna.tsinghua.edu.cn/alpine/	\
    --branch v3.19 \
    --packages "$PACKAGES"	\
    --script-chroot \
    alpine-rootfs-$(date +%Y%m%d).tar.gz - <<'SHELL'
        # Copy some file from the repository root to the rootfs.

        # Install some dev packages and gem mailcatcher.
        #apk add --no-progress -t .make build-base ruby-dev sqlite-dev

        # Clean-up dev packages.  (7)
        #apk del --no-progress .make
SHELL
