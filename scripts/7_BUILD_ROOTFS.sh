#!/bin/bash
source ENV.sh
mkdir -p echo ${BUILDROOT_BUILD_DIR}
#make O=${BUILDROOT_BUILD_DIR} -C ${BUILDROOT_DIR} raspberrypi3_64_defconfig
make O=${BUILDROOT_BUILD_DIR} -C ${BUILDROOT_DIR} menuconfig
make -j4 O=${BUILDROOT_BUILD_DIR} -C ${BUILDROOT_DIR} 
