resource "proxmox_vm_qemu" "create_nodes" {
    count = 6
    name = var.servers[count.index].name
    desc = "debian server"
    vmid = var.servers[count.index].vmid
    target_node = "pve-aria"
    agent = 1
    clone = "debian12-cloud"
    cores = var.servers[count.index].cpu
    sockets = 1
    memory = var.servers[count.index].ram
    scsihw = "virtio-scsi-pci"
    os_type = "cloud-init"
    cpu = "kvm64"
    ciuser = var.vm_ciuser
    cipassword = var.vm_cipwd
    tags = var.servers[count.index].tags
    automatic_reboot = true



    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    disk {
        storage = "pve-vms"
        type = "scsi"
        size = var.servers[count.index].disk
        ssd = 1
        format = "qcow2"

    }

    ipconfig0 = "ip=${var.servers[count.index].ip},gw=192.168.30.1"
    nameserver = "192.168.30.2"
    searchdomain = "sp1.theworkpc.com"


}

