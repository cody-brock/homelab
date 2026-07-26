terraform {
  required_version = ">= 1.10"

  backend "s3" {
    bucket                      = "codybrock-tf-state"
    key                         = "homelab/terraform.tfstate"
    region                      = "auto"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
    use_lockfile                = true
    endpoints                   = { s3 = "https://cfa22f2d5f7788986f1c61c6aa147e85.r2.cloudflarestorage.com" }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

# API token set by env var CLOUDFLARE_API_TOKEN
provider "cloudflare" {}
