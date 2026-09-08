# ClashMi-Bing-Fix

[English](README.md) | [中文说明](README_CN.md)

A small, privacy-friendly JavaScript override for Clash Mi.

## v2.0.0 — Core-first redesign

Starting with v2.0.0, the project treats `bing-rule-fix.js` as the actual patch. The BAT files are optional helpers only.

This is intentional: Clash Mi's official documentation describes custom overrides as a separate layer between the subscription configuration and Clash Mi's built-in override. citeturn0search5

### What it fixes

Some subscriptions contain a rule like:

```text
DOMAIN-SUFFIX,bing.com,<policy>
```

The policy name can be anything. This patch removes every `DOMAIN-SUFFIX,bing.com,...` rule while preserving unrelated rules.

Examples:

```text
DOMAIN-SUFFIX,bing.com,飞鸟云
DOMAIN-SUFFIX,bing.com,Proxy
DOMAIN-SUFFIX,bing.com,节点选择
DOMAIN-SUFFIX,bing.com,DIRECT
```

### Compatibility

The JavaScript intentionally uses a basic `for` loop and avoids callback-based filtering. This is the tested implementation used after encountering JavaScript execution compatibility problems in Clash Mi.

Clash Mi has documented JavaScript override functionality, and its release history includes fixes related to JavaScript overrides. citeturn0search0turn0search1

## Installation

### Recommended method

1. Extract the ZIP.
2. In Clash Mi open:
   `核心设置 → 覆写 → 添加覆写`
3. Select **JS**.
4. Import `bing-rule-fix.js`.
5. If available, set **追加覆写** to **内置-覆写**.
6. Save and enable the override.
7. Reload the profile/configuration.
8. Test `https://cn.bing.com`.

### Optional BAT

`安装补丁.bat` is only a helper for opening the JS and showing the installation path.

It does **not** directly modify Clash Mi's internal storage.

## Why v2.0.0 does not claim to be a one-click EXE

A true zero-click installer would need a stable, documented way to create, bind, and enable a Clash Mi custom override from outside the application.

The official FAQ documents the override layers and behavior, but does not document a public Windows API or supported external installer interface for creating and enabling a custom override. citeturn0search5

Therefore this release deliberately does not edit undocumented Clash Mi files or databases. That avoids a version-specific installer that could break after a Clash Mi update.

Future versions may add a real EXE if a stable supported interface is confirmed.

## Privacy

The patch:

- does not need a subscription URL;
- does not need an access token;
- does not need an account password;
- does not upload configuration data;
- only processes `config.rules` when Clash Mi executes the JS.

## Scope

Only rules whose first two comma-separated fields are:

```text
DOMAIN-SUFFIX,bing.com
```

are removed.

Other domains and unrelated rule types are preserved.

## Disclaimer

Community project. Not affiliated with Clash Mi/KaringX.
