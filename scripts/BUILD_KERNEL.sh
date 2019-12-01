#!/bin/bash
################################################################################
# Basic settings
################################################################################
source ENV.sh

################################################################################
# Uncomment for creating .configuration file from beginning
################################################################################
make ARCH=${TARGET_ARCH} CROSS_COMPILE=${CC_PREFIX} O=${KRN_BUILD_DIR} -C ${KRN_DIR} bcm2711_defconfig
#make ARCH=${TARGET_ARCH} CROSS_COMPILE=${CC_PREFIX} O=${KRN_BUILD_DIR} -C ${KRN_DIR} bcmrpi3_defconfig

################################################################################
# Modifying configurations
################################################################################
make ARCH=${TARGET_ARCH} CROSS_COMPILE=${CC_PREFIX} O=${KRN_BUILD_DIR} -C ${KRN_DIR} menuconfig

################################################################################
# For cleaning: Uncomment
################################################################################
#make -j4 ARCH=${TARGET_ARCH} CROSS_COMPILE=${CC_PREFIX} O=${KRN_BUILD_DIR} -C ${KRN_DIR} clean

################################################################################
# For building
################################################################################
make -j4 ARCH=${TARGET_ARCH} CROSS_COMPILE=${CC_PREFIX} O=${KRN_BUILD_DIR} -C ${KRN_DIR}

make ARCH=${TARGET_ARCH} CROSS_COMPILE=${CC_PREFIX} \
	O=${KRN_BUILD_DIR} \
	-C ${KRN_DIR} \
	INSTALL_MOD_PATH=${KRN_INSTALL_DIR} modules_install

mkdir -p ${KRN_INSTALL_DIR}/../boot
mkdir -p ${KRN_INSTALL_DIR}/../boot/dtb
if [ ${TARGET_ARCH} = "arm" ]; then
	cp -r ${KRN_BUILD_DIR}/arch/arm/boot/Image ${KRN_INSTALL_DIR}/../boot
	cp -r ${KRN_BUILD_DIR}/arch/arm/boot/dts/broadcom/* ${KRN_INSTALL_DIR}/../boot/dtb

else
	cp -r ${KRN_BUILD_DIR}/arch/arm64/boot/Image ${KRN_INSTALL_DIR}/../boot
	cp -r ${KRN_BUILD_DIR}/arch/arm64/boot/dts/broadcom/* ${KRN_INSTALL_DIR}/../boot/dtb
fi
