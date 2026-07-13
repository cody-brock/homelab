terraform {
  required_version = ">= 1.5"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

# API token set by env var CLOUDFLARE_API_TOKEN
provider "cloudflare" {}
