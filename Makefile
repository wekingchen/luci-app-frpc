include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-frpc
PKG_VERSION:=2.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=Your Name <your.email@example.com>
PKG_LICENSE:=MIT
PKG_SECTION:=luci
PKG_DESCRIPTION:=LuCI support for Frpc

LUCI_TITLE:=LuCI Support for frp client
LUCI_DEPENDS:=+luci-base +frpc

include $(TOPDIR)/feeds/luci/luci.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
