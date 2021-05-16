#
# Copyright (C) 2013-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/u-boot.mk

PKG_NAME:=u-boot-stm32mp
PKG_VERSION:=2020.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-v$(PKG_VERSION).tar.gz
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/STMicroelectronics/u-boot.git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)-stm32mp
PKG_MIRROR_HASH:=be58e41a06477748e2ede4f0eb59324553d7d2b1fe877735a9d83abc4747ba64
PKG_SOURCE_OPTS:=--depth 1 --single-branch --branch $(PKG_SOURCE_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/u-boot-stm32mp-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=stm32mp1
  UBOOT_CONFIG:=stm32mp15_trusted
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
	$(CP) $(PKG_BUILD_DIR)/u-boot-nodtb.bin $(STAGING_DIR_IMAGE)/u-boot-nodtb.bin
	$(CP) $(PKG_BUILD_DIR)/u-boot.dtb $(STAGING_DIR_IMAGE)/u-boot.dtb
endef

define Build/Clean
	rm -rf $(STAGING_DIR_IMAGE)/u-boot-nodtb.bin
	rm -rf $(STAGING_DIR_IMAGE)/u-boot.dtb
endef

$(eval $(call BuildPackage/U-Boot))
