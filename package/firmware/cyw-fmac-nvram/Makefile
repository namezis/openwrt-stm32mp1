#
# Copyright (C) 2021 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cyw-fmac-nvram

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/murata-wireless/cyw-fmac-nvram
PKG_SOURCE_VERSION:=HEAD

PKG_MAINTAINER:=Tomasz Zeman <tomasz.zeman@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/cyw-fmac-nvram
  PKGARCH:=all
  SECTION:=firmware
  CATEGORY:=Firmware
  TITLE:=NVRAM Muratas Wi-FiBluetooth
endef

define Package/cyw-fmac-nvram/description
NVRAM (Wireless RF configuration files) for Murata's Wi-Fi/Bluetooth modules
endef

define Build/Compile
	true
endef

define Package/cyw-fmac-nvram/install
	$(INSTALL_DIR) $(1)/lib/firmware/brcm
	$(INSTALL_DATA) \
	    $(PKG_BUILD_DIR)/LICENCE.cypress \
	    $(1)/lib/firmware/LICENCE.cypress.fmac-nvram
	$(INSTALL_DATA) \
	    $(PKG_BUILD_DIR)/cyfmac43430-sdio.1DX.txt \
	    $(1)/lib/firmware/brcm/brcmfmac43430-sdio.txt
	$(INSTALL_DATA) \
	    $(PKG_BUILD_DIR)/cyfmac43430-sdio.1DX.txt \
	    $(1)/lib/firmware/brcm/brcmfmac43430-sdio.st,stm32mp157c-dk2.txt
	$(INSTALL_DATA) \
	    $(PKG_BUILD_DIR)/cyfmac43430-sdio.1DX.txt \
	    $(1)/lib/firmware/brcm/brcmfmac43430-sdio.st,stm32mp157f-dk2.txt
endef

$(eval $(call BuildPackage,cyw-fmac-nvram))
