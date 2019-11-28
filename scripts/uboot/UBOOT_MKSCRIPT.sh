#!/bin/bash

./u-boot-master/tools/./mkimage -A arm64 -O linux -T script -C none -d rpi3-bootscript.txt boot.scr.uimg

