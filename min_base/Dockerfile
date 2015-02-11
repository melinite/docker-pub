# bb min base 

FROM scratch
MAINTAINER David Seong <melinite@gmail.com>

ADD     rootfs.tar.xz /
COPY    ./opkg.conf  /etc/opkg.conf
COPY    ./opkg-install /usr/bin/opkg-install
COPY    ./functions.sh  /lib/functions.sh
RUN     opkg-cl install http://downloads.openwrt.org/snapshots/trunk/x86_64/generic/packages/base/libgcc_4.8-linaro-1_x86_64.ipk && \
        opkg-cl install http://downloads.openwrt.org/snapshots/trunk/x86_64/generic/packages/base/libc_0.9.33.2-1_x86_64.ipk  && \
	opkg-install git curl 
