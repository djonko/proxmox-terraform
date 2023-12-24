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

variable "number_of_instances" {
  type      = number
  sensitive = true
}

variable "pve_target_node" {
  type      = string
  sensitive = true
}

variable "cloud_image_name" {
  type      = string
  sensitive = true
}
variable "cpu_type" {
  type      = string
  sensitive = true
}

variable "bridge_network_name" {
  type      = string
  sensitive = true
}

variable "pve_storage_disk_name" {
  type      = string
  sensitive = true
}

variable "nameserver" {
  type = string
}
variable "searchdomain" {
  type = string
}

variable servers {
  type = list(object({
    name               = string
    ip                 = string
    ipconfig0          = string
    vmid               = string
    startup_onboot     = bool
    startup_attributes = string
    ram                = string
    cpu                = string
    disk               = string
    disk_ssd           = number
    disk_format        = string
    disk_backup        = bool
    macaddr            = string
    tags               = string

  }))
  default = [
    {
      name               = "xxxname"
      ip                 = "192.168.12.7/24"
      vmid               = "100"
      startup_onboot     = true
      startup_attributes = "order=1,up=0,down=0"
      ipconfig0          = "ip=dhcp"
      ram                = "1024"
      cpu                = "1"
      disk               = "10G"
      disk_ssd           = 1
      disk_format        = "qcow2"
      disk_backup        = true
      macaddr            = ""
      tags               = "p7"
    }
  ]
}