include $(TOPDIR)/rules.mk

# 包基本信息
PKG_NAME:=luci-app-frpc
PKG_VERSION:=2.0.0
PKG_RELEASE:=20_cn_sky

PKG_MAINTAINER:=Xingwang Liao <kuoruan@gmail.com>
PKG_LICENSE:=MIT
PKG_SECTION:=luci
PKG_DESCRIPTION:=LuCI support for Frpc

include $(INCLUDE_DIR)/package.mk

# 定义包的信息及依赖
define Package/$(PKG_NAME)
    SECTION:=luci
    CATEGORY:=LuCI
    SUBMENU:=3. Applications
    TITLE:=LuCI support for Frpc
    DEPENDS:=+libc +luci-base +frpc
endef

# 安装文件到相应路径
define Package/$(PKG_NAME)/install
    $(CP) ./files/* $(1)/
endef

# 安装后脚本 (postinst)
define Package/$(PKG_NAME)/postinst
    #!/bin/sh
    [ "\${IPKG_NO_SCRIPT}" = "1" ] && exit 0
    [ -x \${IPKG_INSTROOT}/lib/functions.sh ] || exit 0
    . \${IPKG_INSTROOT}/lib/functions.sh
    default_postinst \$0 \$@
endef

# 安装后脚本 (postinst-pkg)
define Package/$(PKG_NAME)/postinst-pkg
    #!/bin/sh
    if [ -z "\${IPKG_INSTROOT}" ]; then
        ( . /etc/uci-defaults/40_luci-frpc ) && rm -f /etc/uci-defaults/40_luci-frpc
    fi

    chmod 755 "\${IPKG_INSTROOT}/etc/init.d/frpc" >/dev/null 2>&1
    ln -sf "../init.d/frpc" "\${IPKG_INSTROOT}/etc/rc.d/S99frpc" >/dev/null 2>&1
    exit 0
endef

# 卸载前脚本 (prerm)
define Package/$(PKG_NAME)/prerm
    #!/bin/sh
    [ -x \${IPKG_INSTROOT}/lib/functions.sh ] || exit 0
    . \${IPKG_INSTROOT}/lib/functions.sh
    default_prerm \$0 \$@
endef

# 编译包
$(eval $(call BuildPackage,$(PKG_NAME)))
