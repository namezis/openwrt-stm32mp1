#
# Copyright (C) 2021 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cyw-fmac-fw

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/murata-wireless/cyw-fmac-fw
PKG_SOURCE_VERSION:=HEAD

PKG_MAINTAINER:=Tomasz Zeman <tomasz.zeman@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/cyw-fmac-fw
  PKGARCH:=all
  SECTION:=firmware
  CATEGORY:=Firmware
  TITLE:=Firmware for Murata's Wi-Fi/Bluetooth modules
endef

define Package/cyw-fmac-fw/description
Cypress' WLAN firmware with customized "CLM Blob" (regulatory configuration files) for Murata's Wi-Fi/Bluetooth modules
endef

define Build/Compile
	true
endef

define Package/cyw-fmac-fw/install
	$(INSTALL_DIR) $(1)/lib/firmware/brcm
	$(INSTALL_DATA) \
	    $(PKG_BUILD_DIR)/LICENCE \
	    $(1)/lib/firmware/LICENCE.cypress.fmac-fw
	$(INSTALL_DATA) \
	    $(PKG_BUILD_DIR)/cyfmac43430-sdio.bin \
	    $(1)/lib/firmware/brcm/brcmfmac43430-sdio.bin
	$(INSTALL_DATA) \
	    $(PKG_BUILD_DIR)/cyfmac43430-sdio.1DX.clm_blob \
	    $(1)/lib/firmware/brcm/brcmfmac43430-sdio.clm_blob
endef

$(eval $(call BuildPackage,cyw-fmac-fw))
