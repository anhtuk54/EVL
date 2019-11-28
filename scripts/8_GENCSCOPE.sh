#!/bin/bash
source ENV.sh
cd ${KRN_DIR}
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- cscope
sync 
