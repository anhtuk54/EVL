#!/bin/bash

source ENV.sh

# Create more directories and files
cd ${ROOTFS_DIR}
mkdir -p proc sys dev etc etc/init.d usr/lib home home/root root

touch etc/init.d/rcS
chmod +x etc/init.d/rcS
echo "#!bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
mount -t tmpfs none /var
mount -t tmpfs none /dev
mount -o remount,rw /
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/evl/lib
echo /sbin/mdev > /proc/sys/kernel/hotplug
/sbin/mdev -s
mkdir /var/log
syslogd
dropbear" > etc/init.d/rcS

# Back
cd -

# Create new rootfs image file

rm -f ${ROOTFS_IMAGE_DIR}/${ROOTFS_FILE}
dd if=/dev/zero of=${ROOTFS_IMAGE_DIR}/${ROOTFS_FILE} bs=4M count=512
mkfs.${ROOTFS_TYPE} ${ROOTFS_IMAGE_DIR}/${ROOTFS_FILE}

mkdir -p ${ROOTFS_MOUNT_DIR}
sudo mount -t ${ROOTFS_TYPE} ${ROOTFS_IMAGE_DIR}/${ROOTFS_FILE} ${ROOTFS_MOUNT_DIR} -o loop
sudo cp -r ${ROOTFS_DIR}/* ${ROOTFS_MOUNT_DIR}
sudo sync
sudo umount ${ROOTFS_MOUNT_DIR}
rmdir ${ROOTFS_MOUNT_DIR}

