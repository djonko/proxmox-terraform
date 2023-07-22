Create a vm 
```terraform
 terraform apply -target="proxmox_vm_qemu.create_a_vm"
```

Create 5 nodes for kubernetes cluster
```terraform
 terraform apply -target="proxmox_vm_qemu.create_nodes"
```