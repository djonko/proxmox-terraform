resource "proxmox_vm_qemu" "srv_demo_1" {
    count = 5
    name = "${var.servers[count.index].name}"
    desc = "ubuntu server"
    vmid = "${710+count.index}"
    target_node = "pve02"
    agent = 1
    clone = "ubuntu2304-qcwo2"
    cores = 2
    sockets = 1
    cpu = "kvm64"
    memory = 5120
    scsihw = "virtio-scsi-pci"
    os_type = "cloud-init"
    ciuser = var.vm_ciuser
    cipassword = var.vm_cipwd
    tags = "ks3"
    automatic_reboot = true


    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    disk {
        storage = "local"
        type = "scsi"
        size = "10G"
        ssd = 1
        format = "qcow2"

    }

    ipconfig0 = "ip=${var.servers[count.index].ip}/24,gw=192.168.20.1"
    nameserver = "192.168.20.2"
    searchdomain = "ui24.mywire.com"


}

variable "vm_ciuser" {
    type = string
    sensitive = true
}

variable "vm_cipwd" {
    type = string
    sensitive = true
}

variable servers {
  type = list(object({
    name = string
    ip = string
  }))
  default = [
    {
        name = "ks3master01"
        ip = "192.168.20.46"
    },
    {
        name = "ks3master02"
        ip = "192.168.20.47"
    },
    {
        name = "ks3master03"
        ip = "192.168.20.48"
    },
    {
        name = "ks3worker01"
        ip = "192.168.20.49"
    },
    {
        name = "ks3worker02"
        ip = "192.168.20.50"
    }
    ]
}