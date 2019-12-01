#!/bin/bash
source ENV.sh
cd ${KRN_DIR}
make ARCH=${TARGET_ARCH} CROSS_COMPILE=${CC_PREFIX} cscope
sync 
