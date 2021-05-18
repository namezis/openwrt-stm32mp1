#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gobbledegook
PKG_VERSION:=1.01
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/namezis/gobbledegook.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MIRROR_HASH:=661c69bfa91bc02e8cad4662f78230074b96776cabd76262c0a681b15a39830a

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=Gobbledegook
    DEPENDS:=+libc +librt +libstdcpp +glib2 +bluez-daemon
endef

define Package/$(PKG_NAME)/description
    Gobbledegook is a C/C++ standalone Linux Bluetooth LE GATT server using BlueZ over D-Bus.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) files/gobbledegook.conf $(PKG_BUILD_DIR)/gobbledegook.conf
	$(CP) files/ggk-start $(PKG_BUILD_DIR)/ggk-start
endef

define Build/Compile
	$(MAKE) CC=$(TARGET_CC) -C $(PKG_BUILD_DIR)
endef

define Package/$(PKG_NAME)/install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/include/Gobbledegook.h $(1)/usr/include/
	$(CP) $(PKG_BUILD_DIR)/src/libggk.a $(1)/usr/lib/
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) \
	    $(PKG_BUILD_DIR)/src/standalone \
	    $(1)/usr/bin/ggk-standalone
	$(INSTALL_BIN) \
	    $(PKG_BUILD_DIR)/ggk-start \
	    $(1)/usr/bin/ggk-start
	$(INSTALL_DIR) $(1)/etc/dbus-1/system.d
	$(INSTALL_DATA) \
	    $(PKG_BUILD_DIR)/gobbledegook.conf \
	    $(1)/etc/dbus-1/system.d/gobbledegook.conf
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
