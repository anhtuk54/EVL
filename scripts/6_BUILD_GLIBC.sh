#!/bin/bash
################################################################################
# Basic settings
################################################################################
source ENV.sh

################################################################################
# Configurations
################################################################################
mkdir -p ${GLIBC_BUILD_DIR}
cd ${GLIBC_BUILD_DIR}
${GLIBC_DIR}/configure --host=aarch64-linux-gnu \
	--prefix= \
	--enable-add-ons \
	CC=aarch64-linux-gnu-gcc LD=aarch64-linux-gnu-ld

################################################################################
# For building
################################################################################
make -j4
make -j4 install install_root=${GLIBC_INSTALL_DIR}
cp -f ${TOOLCHAIN_LIBC_DIR}/lib/libgcc_s.so.1 ${ROOTFS_DIR}/lib 
