#!/bin/bash

make -C u-boot-master/ CROSS_COMPILE=aarch64-linux-gnu- rpi_3_defconfig
make -j6 -C u-boot-master/ CROSS_COMPILE=aarch64-linux-gnu-
