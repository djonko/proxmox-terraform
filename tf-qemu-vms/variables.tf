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


variable servers {
  type = list(object({
    name = string
    ip   = string
    vmid = string
    ram  = string
    cpu  = string
    disk = string
    tags  = string
  }))
  default = [
    {
      name = "rambert"
      ip   = "192.168.30.7/24"
      vmid = "201"
      ram  = "2048"
      cpu  = "1"
      disk = "20G"
      tags = "p7 debian dashboard portainer"
    },
    {
      name = "gerrard"
      ip   = "192.168.30.8/24"
      vmid = "202"
      ram  = "3072"
      cpu  = "2"
      disk = "20G"
      tags = "p8 debian apps"
    },
    {
      name = "zonedns"
      ip   = "192.168.30.2/24"
      vmid = "102"
      ram  = "2048"
      cpu  = "1"
      disk = "30G"
      tags = "p2 debian pihole"
    },
    {
      name = "zonevpn"
      ip   = "192.168.30.9/24"
      vmid = "103"
      ram  = "2048"
      cpu  = "2"
      disk = "15G"
      tags = "p3 debian firezone vpn"
    },
    {
      name = "ngproxy"
      ip   = "192.168.30.6/24"
      vmid = "104"
      ram  = "1024"
      cpu  = "1"
      disk = "15G"
      tags = "p20 debian ngnix vpn"
    },
    {
      name = "authsrv"
      ip   = "192.168.30.5/24"
      vmid = "105"
      ram  = "2048"
      cpu  = "1"
      disk = "20G"
      tags = "p21 debian ngnix vpn"
    }
  ]
}