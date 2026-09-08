# Clash Mi Bing Rule Fix

用于修复 Clash Mi 中因订阅规则

```text
DOMAIN-SUFFIX,bing.com,飞鸟云
```

导致 Bing / cn.bing.com 无法正常访问的问题。

本项目通过 Clash Mi 的 **JS 覆写（JavaScript Override）**，在订阅配置加载后自动移除这一条规则。

> 本项目不会修改你的订阅 YAML，不需要提供订阅地址，也不需要把订阅配置上传到 GitHub。

## 适用场景

如果你的 Clash Mi 出现以下现象，可以尝试本补丁：

- `cn.bing.com` 无法打开
- Bing 出现 TLS / Handshake 错误
- 删除 `DOMAIN-SUFFIX,bing.com,飞鸟云` 后恢复正常
- 订阅更新后问题又回来

## 原理

订阅中存在：

```yaml
- 'DOMAIN-SUFFIX,bing.com,飞鸟云'
```

该规则会把 `bing.com` 及其子域名交给 `飞鸟云` 策略组处理。

本项目不改变订阅本身，而是在 Clash Mi 加载配置时过滤掉这一条规则：

```javascript
function main(config) {
    if (!Array.isArray(config.rules)) {
        return config;
    }

    config.rules = config.rules.filter(function (rule) {
        if (typeof rule !== "string") {
            return true;
        }

        return rule.trim() !== "DOMAIN-SUFFIX,bing.com,飞鸟云";
    });

    return config;
}
```

## 安装

### 方法 A：Windows 快速安装

双击：

```text
安装补丁.bat
```

脚本会：

1. 检查 `bing-rule-fix.js`
2. 尝试将脚本内容复制到 Windows 剪贴板
3. 打开脚本所在目录
4. 然后按照 Clash Mi 当前版本的界面导入/粘贴 JS 覆写

### 方法 B：手动安装

在 Clash Mi 中进入：

```text
核心设置
  ↓
覆写
  ↓
添加覆写
```

创建一个 JS 类型的覆写。

将：

```text
bing-rule-fix.js
```

中的内容导入或粘贴进去。

建议名称：

```text
Bing Rule Fix
```

如果界面存在“追加覆写”选项，请选择：

```text
内置-覆写
```

保存并启用。

> 不同 Clash Mi 版本的按钮名称可能略有差异，以实际界面为准。

## 验证

启用后重新加载配置，然后访问：

```text
https://cn.bing.com
```

如果之前的问题确实来自上述规则，Bing 应恢复正常。

也可以使用 Clash Mi 的网络测试进行验证。

## 卸载

在 Clash Mi：

```text
核心设置
  ↓
覆写
  ↓
找到 Bing Rule Fix
  ↓
停用或删除
```

然后可以删除本项目文件夹。

## 安全与隐私

本补丁：

- 不读取订阅地址
- 不读取订阅 Token
- 不读取账号密码
- 不上传任何配置
- 不修改订阅服务器上的内容
- 不需要 TUN
- 不需要修改系统 DNS

脚本只处理 Clash 配置对象中的 `config.rules`。

## 重要说明

本项目只针对以下精确规则：

```text
DOMAIN-SUFFIX,bing.com,飞鸟云
```

如果你的订阅使用的是其他策略组名称、其他 Bing 规则或其他规则格式，本补丁可能不会生效。

请不要为了让脚本“更强”而盲目删除所有 Bing 规则；这样可能影响正常的代理策略。

## 为什么不用直接修改 Clash Mi 内部数据库？

Clash Mi 的自定义覆写功能本身就是为这类配置修改设计的，而且自定义覆写可以独立于订阅配置存在。

直接修改客户端内部数据库或私有存储路径容易受到版本变化影响，也可能导致配置损坏。

因此本项目优先采用官方支持的“自定义覆写 + JS”方式。

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
v1.0.0
```

## 反馈问题

提交 Issue 时，请尽量提供：

- Clash Mi 版本
- Windows 版本
- JS 覆写是否已启用
- Bing 的具体错误信息
- 是否删除原规则后恢复正常

**请不要在 Issue、截图或日志中公开订阅地址、Token、账号信息或其他私人配置。**

## 免责声明

本项目是社区性质的配置修复脚本，与 Clash Mi 官方没有隶属关系。

使用前请自行确认脚本内容。项目作者不对因错误配置、第三方订阅或客户端版本变化造成的问题承担责任。
