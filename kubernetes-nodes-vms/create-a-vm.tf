resource "proxmox_vm_qemu" "create_a_vm" {
    count = 1
    name = var.a_server.name
    desc = "ubuntu server"
    vmid = var.a_server.id
    target_node = "pve02"
    agent = 1
    clone = "ubuntu2304-qcwo2"
    cores = 1
    sockets = 1
    cpu = "kvm64"
    memory = 1024
    scsihw = "virtio-scsi-pci"
    os_type = "cloud-init"
    ciuser = var.vm_ciuser
    cipassword = var.vm_cipwd
    tags = "proxy vpn media"
    automatic_reboot = true


    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    disk {
        storage = "pve-vms"
        type = "scsi"
        size = "10G"
        ssd = 1
        format = "qcow2"

    }

    ipconfig0 = "ip=${var.a_server.ip}/24,gw=192.168.20.1"
    nameserver = "192.168.20.2"
    searchdomain = "ui24.mywire.com"


}

