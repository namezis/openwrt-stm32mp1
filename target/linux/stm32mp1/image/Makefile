#
# Copyright (C) 2006-2019 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

KERNEL_LOADADDR := 0xC2000040
NO_COLOR= \e[0m
GREEN_COLOR=\e[32;01m

#################################################
# Images
#################################################

define Image/Prepare

	@echo -e "$(GREEN_COLOR)>>> Make kernel image$(NO_COLOR)"
	mkimage -A $(LINUX_KARCH) \
		-O linux -T kernel \
		-C none -a $(KERNEL_LOADADDR) -e $(if $(KERNEL_ENTRY),$(KERNEL_ENTRY),$(KERNEL_LOADADDR)) \
		-n '$(if $(UIMAGE_NAME),$(UIMAGE_NAME),$(call toupper,$(LINUX_KARCH)) $(VERSION_DIST) Linux-$(LINUX_VERSION))' \
		-d $(KDIR)/zImage $(KDIR)/uImage

	@echo -e "$(GREEN_COLOR)>>> Copy kernel and DTB to rootfs/boot$(NO_COLOR)"
	mkdir -p $(TARGET_DIR)/boot
	$(CP) \
		$(KDIR)/zImage \
		$(TARGET_DIR)/boot/
	$(CP) \
		$(DTS_DIR)/stm32mp157c-dk2.dtb \
		$(TARGET_DIR)/boot/

endef

define Build/sdcard-img-ext4
	@echo -e "$(GREEN_COLOR)>>> Creating SD Card image$(NO_COLOR)"

	rm -rf $@.genimagetmp
	mkdir -p $@.genimagetmp

	$(CP) \
		$(KDIR)/root.ext4 \
		$(STAGING_DIR_IMAGE)

	$(STAGING_DIR_HOST)/bin/genimage \
		--rootpath $(TARGET_DIR) \
		--tmppath $@.genimagetmp \
		--inputpath $(STAGING_DIR_IMAGE) \
		--outputpath $(@D) \
		--config genimage.cfg

	mv \
		$(@D)/sdcard.img \
		$@

endef

#################################################
# Devices
#################################################

define Device/Default
  PROFILES := Generic
  FILESYSTEMS := ext4
  KERNEL := kernel-bin
  IMAGES :=
endef

define Device/dk2-basic
  DEVICE_TITLE := STM32MP157 SD Card Image
  IMAGES := sdcard.bin
  IMAGE/sdcard.bin := sdcard-img-ext4
endef
TARGET_DEVICES += dk2-basic

$(eval $(call BuildImage))
