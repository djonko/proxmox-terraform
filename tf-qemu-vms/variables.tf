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
      tags        = "p7"
    }
  ]
}