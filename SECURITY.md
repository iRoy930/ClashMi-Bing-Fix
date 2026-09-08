# Security Policy

## Script behavior

The JS override only examines `config.rules`.

It removes rules where:

- rule type = `DOMAIN-SUFFIX`
- domain = `bing.com`

The policy/group name is not inspected and is not hard-coded.

The script does not intentionally make network requests.

## Reporting

Do not publish subscription URLs, access tokens, passwords, or private configuration in public issues.
