variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}

variable "proxmox_tls_insecure" {
  type = bool
}

variable "pm_user" {
  type      = string
  sensitive = true
}

variable "pm_password" {
  type      = string
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
    name        = string
    ip          = string
    vmid        = string
    ram         = string
    cpu         = string
    disk        = string
    disk_ssd    = number
    disk_format = string
    disk_backup = bool
    macaddr     = string
    tags        = string
  }))
  default = [
    {
      name        = "rambert"
      ip          = "192.168.30.7/24"
      vmid        = "201"
      ram         = "2048"
      cpu         = "1"
      disk        = "20G"
      disk_ssd    = 1
      disk_format = "qcow2"
      disk_backup = true
      macaddr     = ""
      tags        = "p7 debian dashboard portainer"
    }
  ]
}