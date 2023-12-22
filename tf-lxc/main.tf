resource "proxmox_lxc" "create_a_lxc" {
  count = 1
  target_node = "pve02"
  hostname = var.a_server.name
  password = var.vm_cipwd
  ostemplate = "local:vztmpl/debian-12-standard_12.0-1_amd64.tar.zst"
  unprivileged = true
  memory = 1024
  nameserver = "192.168.20.2"
  searchdomain = "ui24.mywire.com"
  description = "debian 12.01 lxc container"
  vmid = var.a_server.id
  cores = 1
  tags = "media proxy"
  start = true

  rootfs {
    storage = "pve-vms"
    size    = "20G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "${var.a_server.ip}/24"
    gw = "192.168.20.1"
    ip6    = "auto"
  }

  # if you need to mount Proxmox server folder inside the lxc container
  mountpoint {
    key     = "2"
    slot    = 2
    storage = "/mnt/pve/nfs04T01-multimedia"
    volume  = "/mnt/pve/nfs04T01-multimedia"
    mp      = "/nfs/stream_data"
    size    = "4T"
  }

}
