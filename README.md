# Xomware Infrastructure

Core infrastructure for the Xomware platform hub at `xomware.com`.

## Architecture

This workspace manages the central landing page and shared DNS zone that all Xomware apps use as subdomains:

| Subdomain | App | Description |
|-----------|-----|-------------|
| `xomware.com` | Hub | Landing page linking to all apps |
| `xomify.xomware.com` | Xomify | Music tracking & social platform |
| `xomcloud.xomware.com` | Xomcloud | Cloud download service |
| `xomper.xomware.com` | Xomper | Email notification service |

## Resources

- **Route53** - Hosted zone for `xomware.com` (subdomains managed by individual app workspaces)
- **S3 + CloudFront** - Static site hosting via [web-hosting](https://github.com/domgiordano/web-hosting) module
- **ACM** - SSL certificate for `xomware.com`
- **KMS** - Encryption key for S3 bucket
- **WAF** - CloudFront Web ACL via [waf](https://github.com/domgiordano/waf) module

## Modules Used

| Module | Version | Purpose |
|--------|---------|---------|
| [web-hosting](https://github.com/domgiordano/web-hosting) | v1.1.0 | S3 + CloudFront + ACM + Route53 |
| [waf](https://github.com/domgiordano/waf) | v1.1.0 | CloudFront WAF with managed rules |

## Terraform Cloud

- **Organization:** Domjgiordano
- **Workspace:** xomware-infrastructure

### Required Variables

| Variable | Type | Description |
|----------|------|-------------|
| `access_key` | Sensitive | AWS access key |
| `secret_key` | Sensitive | AWS secret key |

### Optional Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `app_name` | `xomware` | Application name |
| `us_canada_only` | `true` | Geo-restrict to US/CA |
| `enable_cloudfront_cache` | `true` | Enable CloudFront caching |
| `retain_on_delete` | `false` | Disable instead of delete CloudFront on destroy |

## Outputs

The Route53 zone ID (`Z0212401124Q11NWHM1D1`) is referenced by each app workspace to create subdomain records.
