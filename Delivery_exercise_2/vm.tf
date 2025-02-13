locals {
  master_node_name = "master-"
  worker_node_name = "worker-"
}

# master vm creations
resource "proxmox_vm_qemu" "proxmox_vm_master" {
  count                  = var.masters_num_nodes
  name                   = "${local.master_node_name}${count.index}"
  target_node            = var.pm_node_name
  clone                  = var.template_vm_name  # here i set the template to start off
  os_type                = "cloud-init"
  full_clone             = false
  agent                  = 1
  memory                 = var.num_nodes_mem
  cores                  = var.num_nodes_cores
  scsihw                 = "virtio-scsi-pci"
  bios                   = "ovmf"
  cicustom               = "vendor=local:snippets/vendor.yaml"
  define_connection_info = false
  ipconfig0              = "ip=172.31.169.10${count.index}/20,gw=172.31.160.1" 
  onboot                 = true
  ciuser                 = var.node_ci_user
  cipassword             = var.node_ci_password
  sshkeys                = var.node_ssh_pub_keys

  disks {
    scsi {
      scsi1 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    virtio {
      virtio0 {
        disk {
          discard  = true
          format   = "raw"
          iothread = false
          size     = var.node_disk_size
          storage  = "local-lvm"
        }
      }
    }
  }
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
  serial {
    id = 0
  }
  lifecycle {
    ignore_changes = [
      ciuser,
      sshkeys,
      network,
      tags
    ]
  }
}

# worker vm creations
resource "proxmox_vm_qemu" "proxmox_vm_worker" {
  count                  = var.workers_num_nodes
  name                   = "${local.worker_node_name}${count.index}"
  target_node            = var.pm_node_name
  clone                  = var.template_vm_name  # here i set the template to start off
  os_type                = "cloud-init"
  full_clone             = false
  agent                  = 1
  memory                 = var.num_nodes_mem
  cores                  = var.num_nodes_cores
  scsihw                 = "virtio-scsi-pci"
  bios                   = "ovmf"
  cicustom               = "vendor=local:snippets/vendor.yaml"
  define_connection_info = false
  ipconfig0              = "ip=172.31.169.10${count.index + var.masters_num_nodes}/20,gw=172.31.160.1" # tried a workaround to avoid ip collision with master
  onboot                 = true
  ciuser                 = var.node_ci_user
  cipassword             = var.node_ci_password
  sshkeys                = var.node_ssh_pub_keys

  disks {
    scsi {
      scsi1 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    virtio {
      virtio0 {
        disk {
          discard  = true
          format   = "raw"
          iothread = false
          size     = var.node_disk_size
          storage  = "local-lvm"
        }
      }
    }
  }
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
  serial {
    id = 0
  }
  lifecycle {
    ignore_changes = [
      ciuser,
      sshkeys,
      network,
      tags
    ]
  }
}
