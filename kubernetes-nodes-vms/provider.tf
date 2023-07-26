terraform {
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}

variable "pm_user" {
  type = string
  sensitive = true
}

variable "pm_password" {
  type = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

variable "vm_ciuser" {
  type      = string
  sensitive = true
}

variable "vm_cipwd" {
  type      = string
  sensitive = true
}


variable servers {
  type = list(object({
    name = string
    ip   = string
  }))
  default = [
    {
      name = "ks3master01"
      ip   = "192.168.20.46"
    },
    {
      name = "ks3master02"
      ip   = "192.168.20.47"
    },
    {
      name = "ks3master03"
      ip   = "192.168.20.48"
    },
    {
      name = "ks3worker01"
      ip   = "192.168.20.49"
    },
    {
      name = "ks3worker02"
      ip   = "192.168.20.50"
    }
  ]
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  //pm_api_token_secret = var.proxmox_api_token_secret
  //pm_api_token_id     = var.proxmox_api_token_id
  pm_tls_insecure     = true
  pm_user = var.pm_user
  pm_password = var.pm_password
}

variable a_server {
  type = object({
    id   = number
    name = string
    ip   = string
  })
  default = {
    id   = 607
    name = "gluetun"
    ip   = "192.168.20.34"
  }
}
