#
# Copyright (C) 2017 Yegor Yefremov <yegorsli...@googlemail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME := genimage
PKG_VERSION := 11

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://github.com/pengutronix/genimage/releases/download/v$(PKG_VERSION)
PKG_HASH:=2ee024bfb2ec157651b86f3365d138ee013dcc48277d86e1eed6f3285a67b532

PKG_FIXUP:=autoreconf
HOST_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/host-build.mk

HOSTCC := $(HOSTCC_NOCACHE)
HOSTCXX := $(HOSTCXX_NOCACHE)

define Host/Install
	$(MAKE) $(HOST_JOBS) -C $(HOST_BUILD_DIR) install
endef

$(eval $(call HostBuild))
