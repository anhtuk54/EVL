#!/bin/bash
################################################################################
# Basic settings
################################################################################
source ENV.sh

################################################################################
# Configurations
################################################################################
#make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=${BUSYBOX_BUILD_DIR} -C ${BUSYBOX_DIR} defconfig
#make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=${BUSYBOX_BUILD_DIR} -C ${BUSYBOX_DIR} menuconfig

################################################################################
# For cleaning: Uncomment
################################################################################
#make -j4 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=${BUSYBOX_BUILD_DIR} -C ${BUSYBOX_DIR} clean

################################################################################
# For building
################################################################################
make -j4 ARCH=${TARGET_ARCH} \
	CROSS_COMPILE=${CC_PREFIX} \
	O=${BUSYBOX_BUILD_DIR} \
	-C ${BUSYBOX_DIR} \
	CONFIG_PREFIX=${BUSYBOX_INSTALL_DIR} \
	install
