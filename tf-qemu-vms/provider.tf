terraform {
  required_version = ">= 0.13.0"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  //pm_api_token_secret = var.proxmox_api_token_secret
  //pm_api_token_id     = var.proxmox_api_token_id
  pm_tls_insecure     = true
  pm_user = var.pm_user
  pm_password = var.pm_password
}