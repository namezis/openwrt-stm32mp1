#
# Copyright (C) 2021 Tomasz Zeman
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/trusted-firmware-a.mk

PKG_NAME:=arm-trusted-firmware-stm32mp1
PKG_VERSION:=2.4
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/STMicroelectronics/arm-trusted-firmware.git
PKG_SOURCE:=$(PKG_NAME)-v$(PKG_VERSION).tar.gz
PKG_SOURCE_VERSION:=v$(PKG_VERSION)-stm32mp
PKG_MIRROR_HASH:=b8f7d16b1d092f6423208f1650121b2a732f7a2e8cd96e725a78318e2e7b00e0
PKG_SOURCE_OPTS:=--depth 1 --single-branch --branch $(PKG_SOURCE_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/arm-trusted-firmware-stm32mp1-$(PKG_VERSION)

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=license.md

include $(INCLUDE_DIR)/package.mk

define Package/arm-trusted-firmware-stm32mp1
    SECTION:=boot
    CATEGORY:=Boot Loaders
    TITLE:=ARM Trusted Firmware for STM32MP1
    DEPENDS:=@TARGET_stm32mp1_DEVICE_dk2-basic +u-boot-stm32mp1
endef

export GCC_HONOUR_COPTS=s

MAKE_VARS = \
	CROSS_COMPILE="$(TARGET_CROSS)"

MAKE_FLAGS = \
	$(subst hard,soft,$(TARGET_CONFIGURE_OPTS)) \
	CROSS="$(TARGET_CROSS)" \
	ARM_ARCH_MAJOR=7 \
	ARCH=aarch32 \
	AARCH32_SP=sp_min \
	PLAT=stm32mp1 \
	STM32MP_SDMMC=1 \
	DTB_FILE_NAME=stm32mp157c-dk2.dtb

MAKE_FLAGS_FIP = \
	$(subst hard,soft,$(TARGET_CONFIGURE_OPTS)) \
	CROSS="$(TARGET_CROSS)" \
	ARM_ARCH_MAJOR=7 \
	ARCH=aarch32 \
	AARCH32_SP=sp_min \
	PLAT=stm32mp1 \
	DTB_FILE_NAME=stm32mp157c-dk2.dtb \
	BL33=$(STAGING_DIR_IMAGE)/u-boot-nodtb.bin \
	BL33_CFG=$(STAGING_DIR_IMAGE)/u-boot.dtb \
	fip

ifeq ($(CONFIG_ARM_TRUSTED_FIRMWARE_STM32MP1_DEBUG),y)
	MAKE_FLAGS+=DEBUG=1
	MAKE_FLAGS_FIP+=DEBUG=1
	BUILD_DIR_TFA:=debug
else
	BUILD_DIR_TFA:=release
endif

define Package/arm-trusted-firmware-stm32mp1/config
	config ARM_TRUSTED_FIRMWARE_STM32MP1_DEBUG
		depends on PACKAGE_arm-trusted-firmware-stm32mp1
		bool "Enable debug for STM32MP1 TF-A"
		default n
		help
			This option enables debug for TF-A.
endef

define Build/fip-image
	+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		CROSS_COMPILE=$(TARGET_CROSS) \
		$(UBOOT_MAKE_FLAGS) $(MAKE_FLAGS_FIP)
endef

define Build/Configure
	$(call Build/Configure/Trusted-Firmware-A)
endef

define Build/Compile
	$(call Build/Compile/Default)
	$(call Build/fip-image)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/build/stm32mp1/$(BUILD_DIR_TFA)/tf-a-stm32mp157c-dk2.stm32 $(STAGING_DIR_IMAGE)/tf-a-stm32mp157c-dk2.stm32
	$(CP) $(PKG_BUILD_DIR)/build/stm32mp1/$(BUILD_DIR_TFA)/fip.bin $(STAGING_DIR_IMAGE)/fip.bin
endef

define Build/Clean
	rm -rf $(STAGING_DIR_IMAGE)/tf-a-stm32mp157c-dk2.stm32
	rm -rf $(STAGING_DIR_IMAGE)/fip.bin
endef

$(eval $(call BuildPackage,arm-trusted-firmware-stm32mp1))
