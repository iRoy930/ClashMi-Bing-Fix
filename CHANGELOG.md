# Changelog

## v2.0.0

### Core-first redesign

- `bing-rule-fix.js` is now the primary product.
- BAT files are optional helpers, not the patch itself.
- Removed the fragile clipboard automation from the installer BAT.
- Installer no longer requires PowerShell or administrator privileges.
- Installer does not touch Clash Mi internal files.
- Documentation now clearly distinguishes the tested JS patch from optional Windows helpers.
- Explicitly avoids claiming unsupported zero-click EXE installation.

### JS behavior

- Removes `DOMAIN-SUFFIX,bing.com,<any policy>`.
- Does not hard-code `飞鸟云`.
- Uses a compatibility-oriented `for` loop.

## v1.0.4

- Fixed the Windows BAT clipboard-copy command.

## v1.0.3

- Reworked BAT files for Windows CMD compatibility.

## v1.0.2

- Fixed JS compatibility issue.
- Removed hard-coded `飞鸟云`.
- Supports arbitrary policy names.

## v1.0.0

- Initial public release.
