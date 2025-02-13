# DevOps Excercise: Terraform & Ansible

## Exercise

1. Prepare a terraform project to create/manage three linux virtual machines on top of a VMware Vsphere or Proxmox VE cluster.
You can choose any linux distribution you like.  
*Only use terraform CLI locally (avoid using Cloud or Enterprise version)*

2. Create an ansible inventory to work on the 3 guests defined above

3. Create an ansible playbook to install docker and create a swarm cluster with the 3 guests

## Delivery

1. I have chosen Proxmox VE. 
   1. Since i don't have a real appliance i have:
      1. Downloaded Proxmov VE ISO
      2. Created a VM in Hyper-V
      3. Enabled nested virtualization
      4. Setup Proxmox
   2. Manually created a template vm to start with.
   3. Launched `setenv.ps1` to authenticate terraform provider to Proxmox
   4. `terraform init`
   5. `terraform plan -out vm.tfplan`
   6. `terraform apply "vm.tfplan"`

2. I let Terraform automatically create the inventory file since is also creating the VMs (using a template `.tpl` file)

3. Ansible folder contains all the requested tasks, please launch `docker-swarm.yml` for chained playbooks run

