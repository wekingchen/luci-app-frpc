include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-frpc
PKG_VERSION:=2.0.0
PKG_RELEASE:=20_cn_sky

PKG_MAINTAINER:=Xingwang Liao <kuoruan@gmail.com>
PKG_LICENSE:=MIT
PKG_SECTION:=luci
PKG_DESCRIPTION:=LuCI support for Frpc

LUCI_TITLE:=LuCI Support for frp client
LUCI_DEPENDS:=+luci-base +frpc

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)
    SECTION:=$(PKG_SECTION)
    CATEGORY:=LuCI
    SUBMENU:=3. Applications
    TITLE:=$(LUCI_TITLE)
    DEPENDS:=$(LUCI_DEPENDS)
    MAINTAINER:=$(PKG_MAINTAINER)
    LICENSE:=$(PKG_LICENSE)
    DESCRIPTION:=$(PKG_DESCRIPTION)
endef

define Package/$(PKG_NAME)/install
    $(INSTALL_DIR) $(1)/etc/config
    $(CP) ./files/etc/config/* $(1)/etc/config/

    $(INSTALL_DIR) $(1)/etc/init.d
    $(CP) ./files/etc/init.d/* $(1)/etc/init.d/

    $(INSTALL_DIR) $(1)/etc/uci-defaults
    $(CP) ./files/etc/uci-defaults/* $(1)/etc/uci-defaults/

    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
    $(CP) ./files/usr/lib/lua/luci/controller/* $(1)/usr/lib/lua/luci/controller/

    # 创建空的 i18n 文件夹
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n

    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/frpc
    $(CP) ./files/usr/lib/lua/luci/model/cbi/frpc/* $(1)/usr/lib/lua/luci/model/cbi/frpc/

    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/frpc
    $(CP) ./files/usr/lib/lua/luci/view/frpc/* $(1)/usr/lib/lua/luci/view/frpc/
endef

# 安装后脚本 (postinst)
define Package/$(PKG_NAME)/postinst
    $(INSTALL_BIN) ./postinst $(1)/CONTROL/postinst
endef

# 安装后脚本 (postinst-pkg)
define Package/$(PKG_NAME)/postinst-pkg
    $(INSTALL_BIN) ./postinst-pkg $(1)/CONTROL/postinst-pkg
endef

# 卸载前脚本 (prerm)
define Package/$(PKG_NAME)/prerm
    $(INSTALL_BIN) ./prerm $(1)/CONTROL/prerm
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
