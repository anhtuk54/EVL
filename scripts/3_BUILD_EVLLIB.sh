#!/bin/bash

################################################################################
# Basic settings
################################################################################
source ENV.sh

################################################################################
# Remove older compiled files
################################################################################
rm -rf ${EVL_BUILD_DIR}

################################################################################
# Build and Install
################################################################################
make -j4 -C ${EVL_DIR} \
	ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- UAPI=${KRN_DIR} \
	O=${EVL_BUILD_DIR} DESTDIR=${EVL_INSTALL_DIR} install 
sync
