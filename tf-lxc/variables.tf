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
