#!/bin/bash

source ENV.sh

#QEMU_PATH=${LOCAL_DIR}/qemu_install/bin
#INITRD_PATH=

#-append "rw earlycon=uart8250,mmio32,0x3f215040 cconsole=/dev/tty1 onsole=/dev/ttyAMA0 root=/dev/mmcblk0p2 rootfstype=ext4  loglevel=8 rootwait fsck.repair=yes memtest=1 noinitrd" \
#-dtb ${BOOT_PATH}/bcm2837-rpi-3-b.dtb
#-cpu cortex-a53

#	-initrd ${INITRD_PATH}/rootfs.cpio
#	-nographic 

qemu-system-aarch64 \
	-machine virt \
	-machine type=virt \
	-cpu cortex-a53 \
	-smp 4 \
	-m 1024 \
	-kernel ${ROOTFS_IMAGE_DIR}/boot/Image \
	-dtb ${ROOTFS_IMAGE_DIR}/boot/dtb/bcm2837-rpi-3-b.dtb \
	-append "earlycon=/dev/ttyAMA0 root=/dev/vda" \
	-drive if=none,file=${ROOTFS_IMAGE_DIR}/${ROOTFS_FILE},id=hd0 \
	-device virtio-blk-device,drive=hd0 \
	-netdev user,id=mynet -device virtio-net-pci,netdev=mynet \
	-net nic \
	-net user,hostfwd=tcp::2222-:22 \
	-serial mon:stdio
