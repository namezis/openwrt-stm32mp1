#
# Copyright (C) 2013-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_VERSION:=2018.11
PKG_RELEASE:=r2.1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/STMicroelectronics/u-boot.git
PKG_SOURCE_VERSION:=161ca183f164d65e0c05affd618e07b85ab7edba

PKG_HASH:=737c93f2ea03fec669e840dbee32bcf6238e6924ff5f20e4f1c472ee24e5d37e

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=stm32mp1
  UBOOT_IMAGE:=spl/u-boot-spl.stm32 u-boot.img
  UBOOT_CONFIG:=stm32mp15_basic
#  HIDDEN:=1
endef

define U-Boot/stm32mp1
  NAME:=Universal Boot Loader for STM32MP embedded devices
  BUILD_DEVICES:=stm32mp1
endef

UBOOT_MAKE_FLAGS += DEVICE_TREE=stm32mp157c-dk2

UBOOT_TARGETS := \
	stm32mp1

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/spl/u-boot-spl.stm32 $(STAGING_DIR_IMAGE)/$(BUILD_DEVICES)-u-boot-spl.stm32
	$(CP) $(PKG_BUILD_DIR)/u-boot.img $(STAGING_DIR_IMAGE)/$(BUILD_DEVICES)-u-boot.img
endef

$(eval $(call BuildPackage/U-Boot))
