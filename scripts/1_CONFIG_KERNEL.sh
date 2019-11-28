#!/bin/bash
################################################################################
# Basic settings
################################################################################
source ./ENV.sh

################################################################################
# Uncomment for creating .configuration file from beginning
################################################################################
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=${KRN_BUILD_DIR} -C ${KRN_DIR} defconfig
#make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=${KRN_BUILD_DIR} -C ${KRN_DIR} bcm2711_defconfig
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=${KRN_BUILD_DIR} -C ${KRN_DIR} bcmrpi3_defconfig

################################################################################
# Modifying configurations
################################################################################
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=${KRN_BUILD_DIR} -C ${KRN_DIR} menuconfig
