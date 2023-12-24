terraform {
  required_version = ">= 0.13.0"
  required_providers {
    proxmox = {
      #source  = "telmate/proxmox"
      #version = "2.9.13"
      #source  = "TheGameProfi/proxmox"
      #version = ">=2.9.15"

      source  = "MaartendeKruijf/proxmox"
      version = "0.0.1"
    }
  }
}
provider "proxmox" {
  pm_api_url      = var.proxmox_api_url
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_api_token_id     = var.proxmox_api_token_id
  pm_tls_insecure = var.proxmox_tls_insecure
  pm_debug        = true
}