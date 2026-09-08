# ClashMi-Bing-Fix

用于修复 Clash Mi 中因特定 `bing.com` 规则导致 Bing / cn.bing.com 无法正常访问的问题。

## 最新版本：v1.0.2

**推荐所有用户使用 v1.0.2。**

v1.0.2 同时包含两个重要修复：

1. 修复部分 Clash Mi JS 执行环境中的 `SyntaxError: return not in a function` 兼容性问题。
2. 不再把策略组名称写死为 `飞鸟云`，改为兼容任意策略组名称。

## v1.0.2 更新内容

### 1. 修复 JS 兼容性

旧版本使用较复杂的 JavaScript 数组回调写法，在部分 Clash Mi 环境中可能出现：

```text
SyntaxError: return not in a function
```

v1.0.2 改用简单的 `for` 循环处理规则，减少对 JS 执行环境特性的依赖。

### 2. 不再写死“飞鸟云”

旧版本针对：

```text
DOMAIN-SUFFIX,bing.com,飞鸟云
```

但不同订阅可能使用不同策略组名称。

v1.0.2 现在识别：

```text
DOMAIN-SUFFIX,bing.com,<任意策略组>
```

例如：

```text
DOMAIN-SUFFIX,bing.com,飞鸟云
DOMAIN-SUFFIX,bing.com,Proxy
DOMAIN-SUFFIX,bing.com,节点选择
DOMAIN-SUFFIX,bing.com,美国节点
DOMAIN-SUFFIX,bing.com,DIRECT
```

第三段策略组名称不参与判断。

## 原理

脚本只检查规则的前两个字段：

```text
DOMAIN-SUFFIX
bing.com
```

符合条件的规则会被移除，其他规则原样保留。

## 安装

### Windows 快速安装

双击：

```text
安装补丁.bat
```

然后在 Clash Mi 中：

```text
核心设置 → 覆写 → 添加覆写
```

创建 JS 类型覆写，将 `bing-rule-fix.js` 导入或粘贴进去。

如果有“追加覆写”选项，选择：

```text
内置-覆写
```

保存并启用。

### 手动安装

直接打开 `bing-rule-fix.js`，复制全部内容，在 Clash Mi 的 JS 覆写编辑器中粘贴并保存。

## 验证

启用后重新加载配置，然后访问：

```text
https://cn.bing.com
```

如果之前的问题确实来自上述规则，Bing 应恢复正常。

## 卸载

在 Clash Mi：

```text
核心设置 → 覆写
```

找到对应的 Bing 修复 JS 覆写，停用或删除即可。

## 隐私与安全

本补丁：

- 不读取订阅地址
- 不读取订阅 Token
- 不读取账号密码
- 不上传 Clash 配置
- 不修改订阅服务器上的内容
- 不需要 TUN
- 不需要修改系统 DNS

脚本只处理 Clash 配置对象中的 `config.rules`。

## 适用范围

当前版本针对：

```text
DOMAIN-SUFFIX,bing.com,<任意策略组>
```

如果你的订阅使用的是其他 Bing 规则格式，例如：

```text
DOMAIN,bing.com,...
```

本补丁不会主动删除。

## 为什么不直接修改 Clash Mi 内部数据库？

本项目优先使用 Clash Mi 的自定义 JS 覆写功能，而不是修改客户端私有数据库。

这样更安全，也更不容易因为 Clash Mi 后续版本改变内部存储结构而失效。

## 项目结构

```text
ClashMi-Bing-Fix/
├─ bing-rule-fix.js
├─ 安装补丁.bat
├─ 卸载补丁.bat
├─ README.md
├─ SECURITY.md
├─ CHANGELOG.md
└─ LICENSE
```

## 版本

当前版本：

```text
v1.0.2
```

## 反馈问题

提交 Issue 时，请尽量提供：

- Clash Mi 版本
- Windows 版本
- JS 覆写是否已启用
- Bing 的具体错误信息

**请不要公开订阅地址、Token、账号信息或私人配置。**

## 免责声明

本项目是社区性质的配置修复脚本，与 Clash Mi 官方没有隶属关系。
