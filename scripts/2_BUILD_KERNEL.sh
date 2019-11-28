#!/bin/bash
################################################################################
# Basic settings
################################################################################
source ENV.sh

################################################################################
# For cleaning: Uncomment
################################################################################
#make -j4 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=${KRN_BUILD_DIR} -C ${KRN_DIR} clean

################################################################################
# For building
################################################################################
make -j4 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=${KRN_BUILD_DIR} -C ${KRN_DIR}

make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
	O=${KRN_BUILD_DIR} \
	-C ${KRN_DIR} \
	INSTALL_MOD_PATH=${KRN_INSTALL_DIR} modules_install

mkdir -p ${KRN_INSTALL_DIR}/../boot
mkdir -p ${KRN_INSTALL_DIR}/../boot/dtb
cp -r ${KRN_BUILD_DIR}/arch/arm64/boot/Image ${KRN_INSTALL_DIR}/../boot
cp -r ${KRN_BUILD_DIR}/arch/arm64/boot/dts/broadcom/* ${KRN_INSTALL_DIR}/../boot/dtb
