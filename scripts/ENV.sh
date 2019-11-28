#!/bin/bash
################################################################################
# Basic settings
################################################################################
BASE_DIR=`pwd`
SOURCE_DIR=${BASE_DIR}/../source
OUT_DIR=${BASE_DIR}/../output

export ROOTFS_NAME=mini-rootfs
export ROOTFS_TYPE=ext4
export ROOTFS_FILE=${ROOTFS_NAME}.${ROOTFS_TYPE}
export ROOTFS_DIR=${BASE_DIR}/../output/image/rootfs
export ROOTFS_IMAGE_DIR=${BASE_DIR}/../output/image
export ROOTFS_MOUNT_DIR=${BASE_DIR}/../output/image/tmp

#KRN_NAME=linux-evl
KRN_NAME=linux-rpi-5.4.y

export KRN_DIR=${BASE_DIR}/../source/${KRN_NAME}
export KRN_BUILD_DIR=${BASE_DIR}/../output/${KRN_NAME}
export KRN_INSTALL_DIR=${ROOTFS_DIR}
export KRN_INSTALL_BOOT_DIR=${BASE_DIR}/../output/image/boot

export EVL_DIR=${BASE_DIR}/../source/libevl
export EVL_BUILD_DIR=${BASE_DIR}/../output/libevl
export EVL_INSTALL_DIR=${ROOTFS_DIR}/usr/evl

export BUSYBOX_DIR=${BASE_DIR}/../source/busybox
export BUSYBOX_BUILD_DIR=${BASE_DIR}/../output/busybox
export BUSYBOX_INSTALL_DIR=${ROOTFS_DIR}

export DROPBEAR_DIR=${BASE_DIR}/../source/dropbear
export DROPBEAR_BUILD_DIR=${BASE_DIR}/../output/dropbear
export DROPBEAR_INSTALL_DIR=${ROOTFS_DIR}

export GLIBC_DIR=${BASE_DIR}/../source/glibc
export GLIBC_BUILD_DIR=${BASE_DIR}/../output/glibc
export GLIBC_INSTALL_DIR=${ROOTFS_DIR}

export BUILDROOT_DIR=${SOURCE_DIR}/buildroot
export BUILDROOT_BUILD_DIR=${BASE_DIR}/../output/buildroot

################################################################################
# If toolchain is aimed for specific configuration. Uncomment for using it
################################################################################
#TOOLCHAIN_BIN_DIR=${BASE_DIR}/../toolchain/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin
TOOLCHAIN_BIN_DIR=${BASE_DIR}/../toolchain/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu/bin
#TOOLCHAIN_LIBC_DIR=${BASE_DIR}/../toolchain/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu/aarch64-linux-gnu/libc
export PATH=$PATH:${TOOLCHAIN_BIN_DIR}

