#
# Copyright (C) 2018 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cyw-bt-firmware

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/murata-wireless/cyw-bt-patch
PKG_SOURCE_VERSION:=HEAD

include $(INCLUDE_DIR)/package.mk

define Package/cyw-bt-firmware
  PKGARCH:=all
  SECTION:=firmware
  CATEGORY:=Firmware
  TITLE:=Firmware for MURATA 1DX Bluetooth devices
endef

define Build/Compile
endef

define Package/cyw-bt-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware/brcm
	$(INSTALL_DATA) \
	    $(PKG_BUILD_DIR)/CYW43430A1.1DX.hcd \
	    $(1)/lib/firmware/brcm/BCM43430A1.hcd
endef

$(eval $(call BuildPackage,cyw-bt-firmware))
