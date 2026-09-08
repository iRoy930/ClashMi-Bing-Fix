# Security Policy

## Reporting a security issue

如果发现本项目存在安全问题，请不要在公开 Issue 中发布敏感信息。

提交前请删除：

- Subscription URLs
- Access tokens
- Account credentials
- Private configuration files

本项目设计为不需要任何订阅凭据。

## Scope

JavaScript 覆写只过滤规则中前两个字段同时为：

```text
DOMAIN-SUFFIX,bing.com
```

第三段策略组名称不写死。

脚本本身不主动执行网络请求，也不会上传配置数据。
