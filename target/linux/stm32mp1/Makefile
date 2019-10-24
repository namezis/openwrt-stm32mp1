#
# Copyright (C) 2013-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=stm32mp1
BOARDNAME:=STM32MP1
FEATURES:=audio display fpu gpio pcie rtc usb usbgadget squashfs targz nand ubifs boot-part rootfs-part
CPU_TYPE:=cortex-a7
CPU_SUBTYPE:=neon-vfpv4

MAINTAINER:=Tomasz Zeman <tomasz.zeman@gmail.com>

KERNEL_PATCHVER:=4.19

include $(INCLUDE_DIR)/target.mk

KERNELNAME:=zImage dtbs

DEFAULT_PACKAGES += uboot-envtools mkf2fs e2fsprogs blkid

$(eval $(call BuildTarget))
