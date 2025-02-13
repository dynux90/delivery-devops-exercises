locals {
  # as i create the vms with Terraform, i can use the same resource to create a local array to store the data i need to create the invetory file.
  masters_vms_info = [
    for i in range(var.masters_num_nodes) : {
      name          = proxmox_vm_qemu.proxmox_vm_master[i].name
      user          = "ansible"
      ssh_priv_path = "/home/ansible/.ssh/id_rsa"
      ip            = split("/", split("=", split(",", proxmox_vm_qemu.proxmox_vm_master[i].ipconfig0)[0])[1])[0] #workaround to get only the ip address
    }
  ]
  workers_vms_info = [
    for i in range(var.workers_num_nodes) : {
      name          = proxmox_vm_qemu.proxmox_vm_worker[i].name
      user          = "ansible"
      ssh_priv_path = "/home/ansible/.ssh/id_rsa"
      ip            = split("/", split("=", split(",", proxmox_vm_qemu.proxmox_vm_worker[i].ipconfig0)[0])[1])[0]
    }
  ]
}


# this is the actual resource that creates the template given the local variabile generated above.
resource "local_file" "ansible_inventory" {
  filename = "${path.module}/ansible/inventory.ini"

  content = templatefile(
    "${path.module}/templates/ansible_inventory_ini.tpl",
    {
      master_vms  = local.masters_vms_info
      workers_vms = local.workers_vms_info
    }
  )
}
