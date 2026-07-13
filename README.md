# homelab

Personal infrastructure, deliberately over-engineered as a learning project:
Terraform for provisioning, k3s for the cluster, Argo CD for GitOps.

Currently managing: DNS for codybrock.dev (Cloudflare, via Terraform).

Notes on decisions and mistakes live in [notes/](notes/).



# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "6bd1f01ce4f83b1bfd29abf400ed5a28/bc5679745b3e21446c8c5cd89f8c1cef"
resource "cloudflare_dns_record" "apex_a_109" {
  content         = "185.199.109.153"
  name            = "codybrock.dev"
  proxied         = false
  ttl             = 1
  type            = "A"
  zone_id         = var.zone_id
}

# __generated__ by Terraform from "6bd1f01ce4f83b1bfd29abf400ed5a28/942b46d8937bdaa14dc7d058dd66f446"
resource "cloudflare_dns_record" "apex_a_110" {
  content         = "185.199.110.153"
  name            = "codybrock.dev"
  proxied         = false
  ttl             = 1
  type            = "A"
  zone_id         = var.zone_id
}

# __generated__ by Terraform from "6bd1f01ce4f83b1bfd29abf400ed5a28/95161deaea448f1f33f6a70d201b4ebb"
resource "cloudflare_dns_record" "apex_a_108" {
  content         = "185.199.108.153"
  name            = "codybrock.dev"
  proxied         = false
  ttl             = 1
  type            = "A"
  zone_id         = var.zone_id
}

# __generated__ by Terraform from "6bd1f01ce4f83b1bfd29abf400ed5a28/0ef660ea1d2282191fef2a6c7558defc"
resource "cloudflare_dns_record" "www_cname_github" {
  content         = "cody-brock.github.io"
  name            = "www.codybrock.dev"
  proxied         = false
  settings = {
    flatten_cname = false
    ipv4_only     = false
    ipv6_only     = false
  }
  ttl             = 1  # in Cloudflare, 1 means auto
  type            = "CNAME"
  zone_id         = var.zone_id
}

# __generated__ by Terraform from "6bd1f01ce4f83b1bfd29abf400ed5a28/9ea37079914a22379aa59360c07042b8"
resource "cloudflare_dns_record" "apex_a_111" {
  content         = "185.199.111.153"
  name            = "codybrock.dev"
  proxied         = false
  ttl             = 1
  type            = "A"
  zone_id         = var.zone_id
}
