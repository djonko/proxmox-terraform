Create a vm 
```terraform
 terraform apply -target="proxmox_vm_qemu.create_a_vm"
```

Create 5 nodes for kubernetes cluster
```terraform
 terraform apply -target="proxmox_vm_qemu.create_nodes"
```

Create a Lxc container 
```terraform
 terraform apply -target="proxmox_lxc.create_a_lxc"
```