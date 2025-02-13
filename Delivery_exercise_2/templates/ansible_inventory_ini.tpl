[main]
%{ for vm in master_vms ~}
${vm.name} ansible_host=${vm.ip} ansible_user=${vm.user} ansible_ssh_private_key_file=${vm.ssh_priv_path} ansible_port=22
%{ endfor ~}

[workers]
%{ for vm in workers_vms ~}
${vm.name} ansible_host=${vm.ip} ansible_user=${vm.user} ansible_ssh_private_key_file=${vm.ssh_priv_path} ansible_port=22
%{ endfor ~}

[all:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_extra_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
