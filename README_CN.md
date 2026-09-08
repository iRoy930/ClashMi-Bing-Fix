# ClashMi-Bing-Fix v2.0.0

**中文说明**

> 这是一个用于 Clash Mi 的 JS Override 补丁，用来移除可能导致 Bing 连接异常的 `DOMAIN-SUFFIX,bing.com,...` 规则。

[English README](README.md)

## 解决什么问题？

如果你的 Clash Mi 订阅配置中存在类似：

```text
DOMAIN-SUFFIX,bing.com,飞鸟云
```

或者：

```text
DOMAIN-SUFFIX,bing.com,Proxy
DOMAIN-SUFFIX,bing.com,DIRECT
DOMAIN-SUFFIX,bing.com,其他策略
```

可能导致 `cn.bing.com` 出现 TLS 握手失败、无法打开等问题。

本补丁会自动删除：

```text
DOMAIN-SUFFIX,bing.com,<任意策略>
```

而不会删除其他无关规则。

## 核心文件

真正起作用的是：

```text
bing-rule-fix.js
```

它应该导入 Clash Mi 的：

**核心设置 → 配置覆盖 → 添加覆盖 → JavaScript（JS）**

然后启用这个 **JavaScript 配置覆盖**。

如果你的版本提供：

**追加到内置配置覆盖（Append Override to Built-in Override）**

建议同时启用。

> 不同版本的 Clash Mi 中文界面名称可能略有不同。如果你的界面仍显示英文，请按括号中的英文名称查找。

## Windows 批处理文件（BAT）是什么？

### 安装补丁.bat

这是一个可选的 Windows 辅助文件。

它不会修改 Clash Mi 内部文件，也不会读取你的订阅地址、Token 或密码。

它主要用于：

1. 检查 `bing-rule-fix.js` 是否存在
2. 打开 JS 文件
3. 提示你按照 Clash Mi 的 Override 流程进行导入

### 卸载补丁.bat

同样只是辅助文件。

它不会强行修改 Clash Mi 内部配置。

卸载时，请在 Clash Mi 的 JS Override 页面中：

- 禁用该 Override；或
- 删除该 Override。

## 为什么不做“真正的一键 EXE”？

Clash Mi 官方公开资料说明了 Override 的使用方式，但目前没有找到稳定、公开、受支持的 Windows 外部接口，可以让第三方程序安全地创建、绑定并启用自定义 Override。

因此本版本不修改 Clash Mi 未公开的内部存储，也不声称提供不可靠的“一键 EXE”。

这样做可以避免：

- Clash Mi 升级后补丁失效
- 修改错误的内部配置
- 覆盖用户自己的配置
- 读取或处理私人订阅信息

## 隐私

本补丁：

- 不需要你的订阅 URL
- 不需要 Token
- 不需要密码
- 不需要上传 Clash Mi 配置
- JS 本身不主动发起网络请求

请不要把包含订阅地址、Token、密码等私人信息的配置文件上传到公开仓库。

## 工作原理

脚本只检查 Clash Mi 配置中的：

```javascript
config.rules
```

如果某条规则的前两个字段分别是：

```text
DOMAIN-SUFFIX
bing.com
```

就将该规则删除。

例如：

```text
DOMAIN-SUFFIX,bing.com,飞鸟云
```

会被删除。

而：

```text
DOMAIN-SUFFIX,google.com,飞鸟云
DOMAIN-SUFFIX,microsoft.com,Proxy
DOMAIN,bing.com,Proxy
```

不会被这个脚本删除。

## 使用步骤

第一次使用时，按下面步骤操作：

1. 打开 **Clash Mi → 核心设置 → 配置覆盖（Override）**。
2. 点击 **添加覆盖（Add Override）**。
3. 选择 **JavaScript（JS）**。
4. 导入本项目中的 `bing-rule-fix.js`。
5. 启用这个 **JavaScript 配置覆盖**。
6. 如果看到 **追加到内置配置覆盖（Append Override to Built-in Override）**，建议同时启用。
7. 回到订阅页面，执行一次 **更新订阅**。
8. 打开 `https://cn.bing.com`，测试 Bing 是否恢复正常。

> **提示：** Clash Mi 不同版本的界面文字可能存在差异。看到英文时，可按照括号里的英文名称定位对应选项。

如果 Bing 恢复正常，说明补丁生效。

## 文件结构

```text
ClashMi-Bing-Fix-v2.0.0/
├── bing-rule-fix.js
├── 安装补丁.bat
├── 卸载补丁.bat
├── README.md
├── README_CN.md
├── CHANGELOG.md
├── SECURITY.md
└── LICENSE
```

## 版本

当前版本：

**v2.0.0**

核心思路：

> JS 是补丁本体，BAT 只是 Windows 辅助工具。

