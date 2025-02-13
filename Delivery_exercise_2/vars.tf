variable "pm_tls_insecure" {
  description = "Set to true to ignore certificate errors"
  type        = bool
  default     = true
}
variable "pm_host" {
  description = "The hostname or IP of the proxmox server"
  type        = string
  default     = "https://172.31.169.93:8006/api2/json"
}
variable "pm_node_name" {
  description = "name of the proxmox node to create the VMs on"
  type        = string
  default     = "pve"
}

variable "masters_num_nodes" {
  description = "Enter the number of VMs you want for worker nodes."
  default     = 1
}

variable "workers_num_nodes" {
  description = "Enter the number of VMs you want for worker nodes."
  default     = 2
}

variable "num_nodes_cores" {
  description = "Enter the value for the amount of cores for your worker nodes. ie. 2"
  default     = "2"
}

variable "num_nodes_mem" {
  description = "Enter the value for the amount of RAM for your worker nodes. ie. 2048"
  default     = "4096"
}
variable "node_disk_size" {
  description = "Enter the size of your Master node disks ie. 80G"
  type        = string
  default     = "32G"
}

variable "template_vm_name" {
  description = "Name of the template VM"
  type        = string
  default     = "ubuntu-2404-cloudinit-template"
}

variable "node_ci_user" {
  description = "Set ssh user on generated VM"
  type        = string
  default     = "dynux"
}

variable "node_ci_password" {
  description = "Set password for ssh user on generated VM"
  type        = string
  sensitive   = true #password is in setenv.ps1
}

variable "node_ssh_pub_keys" {
  description = "SSH authorized keys"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDC7i9iqc+ug8/CLKqnQXXXJL2QhOYAdn/qji4QzPJxPZpzPjxZ2LkwX18AsofqYeIR9+VrNE+bEaE867oOv4+cJER40MfD6IJc7+O9oB3R6DmEHej0SmfwV24goBqaP4XPfWLsv97jXzKTwthpqhUYRxkjhPEFSB7jgtb5pWq2PVjlecv7++WSoZs/4j12J9NX8j+7LvfeLd04i51Co+lfr4StFj6QhaNGrCcsvNvbXVFUeGGfH0r++koWAJBHd3b0zV0oe0aJPkRsxQBLKHGR4FEuXfY3mwjiBWp5MxMKXe5AXiimPSFbwOYez1MmCV4baSI7gAZwPRw2s1fAWcNR168vgEU+YNiG4dhVq7H/2lX/0CYa5dpvR3UNj7DHA8MVn2r+1s2FWgNZtU/oFwJ13N3gvJQT6xMfhy/vqo6mFoFEaciAb2Vo7N2DBOyQMA82mzoWHONigdOzWe6dEQimVOb/rs19evoefWSEhQeo42G0wMH2ycsur112s9VdgVE="
}
