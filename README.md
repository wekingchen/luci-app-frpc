# luci-app-frpc

[![OpenWrt](https://img.shields.io/badge/OpenWrt-compatible-blue.svg)](https://openwrt.org/)
[![GitHub license](https://img.shields.io/github/license/wekingchen/luci-app-frpc)](https://github.com/wekingchen/luci-app-frpc/blob/main/LICENSE)

`luci-app-frpc` 是一个用于 OpenWrt 路由器的 LuCI 应用插件，帮助用户通过 Frpc 客户端实现内网穿透。该应用提供了简单易用的 Web 界面，使用户能够便捷地管理和配置 Frpc 客户端。

项目地址：[https://github.com/wekingchen/luci-app-frpc](https://github.com/wekingchen/luci-app-frpc)

## 功能特性

- 支持通过 LuCI 界面管理 Frpc 客户端
- 便于配置和控制 Frpc 的连接与穿透设置
- 提供 OpenWrt 平台上的开源支持

## 编译步骤

### 环境准备

1. 获取并准备好 OpenWrt SDK 或完整的 OpenWrt 源码树。
2. 进入 OpenWrt 源码根目录。

### 将插件克隆到 OpenWrt package 目录

在 OpenWrt 的 `package` 目录中克隆该项目：

```bash
cd package
git clone https://github.com/wekingchen/luci-app-frpc.git
cd ..
