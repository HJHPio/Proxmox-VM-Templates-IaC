#!/bin/bash

export TF_VAR_proxmox_host="proxmox-host.example.local"
export TF_VAR_proxmox_user="root"
export TF_VAR_proxmox_password="veryhardpasswordexample"
export TF_VAR_script_path="../scripts/createCustomizedTemplateVM.sh"
export TF_VAR_vm_template_storage_name="local-lvm"
export GENERATE_KEYS=true
export TF_VAR_ssh_public_keys_src="../keys/ssh-pub-keys.key"
export TF_VAR_centos_image_file="/var/lib/vz/template/iso/CentOS-Stream-GenericCloud-x86_64-9-20240527.0.x86_64.qcow2"
export TF_VAR_centos_image_url="https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-x86_64-9-20240527.0.x86_64.qcow2"
export TF_VAR_centos_template_id="20000"
export TF_VAR_centos_template_name="CentOS-S9-CI-SSH-TF"
export TF_VAR_centos_template_password="centospass"
export TF_VAR_centos_template_user="centosuser"
export TF_VAR_fcos_image_file="/var/lib/vz/template/iso/fedora-coreos-39.20240210.3.0-qemu.x86_64.qcow2.xz"
export TF_VAR_fcos_image_url="https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/39.20240210.3.0/x86_64/fedora-coreos-39.20240210.3.0-qemu.x86_64.qcow2.xz"
export TF_VAR_fcos_template_id="21000"
export TF_VAR_fcos_template_name="FCOS-39-QCOW2-TF"
export TF_VAR_fcos_additional_flags="--skip-cloud-init-settings"

echo 'Welcome to Confizard!'

set -e
# 1. Clone the repository
git clone https://gitlab.com/HJHPio/Proxmox-VM-Templates-IaC.git
cd Proxmox-VM-Templates-IaC

# 2. Build the Docker image
cd confizard
docker build -t proxmox-tmplt-deployer .

cd ..
# 3. Run the container with repo mounted
docker run --rm -it \
  -v "$(pwd)":/runtime \
  -e GENERATE_KEYS="${GENERATE_KEYS:-true}" \
  -e TF_VAR_proxmox_host="${TF_VAR_proxmox_host}" \
  -e TF_VAR_proxmox_user="${TF_VAR_proxmox_user}" \
  -e TF_VAR_proxmox_password="${TF_VAR_proxmox_password}" \
  -e TF_VAR_script_path="${TF_VAR_script_path}" \
  -e TF_VAR_vm_template_storage_name="${TF_VAR_vm_template_storage_name}" \
  -e TF_VAR_ssh_public_keys_src="${TF_VAR_ssh_public_keys_src}" \
  -e TF_VAR_centos_image_file="${TF_VAR_centos_image_file}" \
  -e TF_VAR_centos_image_url="${TF_VAR_centos_image_url}" \
  -e TF_VAR_centos_template_id="${TF_VAR_centos_template_id}" \
  -e TF_VAR_centos_template_name="${TF_VAR_centos_template_name}" \
  -e TF_VAR_centos_template_password="${TF_VAR_centos_template_password}" \
  -e TF_VAR_centos_template_user="${TF_VAR_centos_template_user}" \
  -e TF_VAR_fcos_image_file="${TF_VAR_fcos_image_file}" \
  -e TF_VAR_fcos_image_url="${TF_VAR_fcos_image_url}" \
  -e TF_VAR_fcos_template_id="${TF_VAR_fcos_template_id}" \
  -e TF_VAR_fcos_template_name="${TF_VAR_fcos_template_name}" \
  -e TF_VAR_fcos_additional_flags="${TF_VAR_fcos_additional_flags}" \
  proxmox-tmplt-deployer

echo 'Confizard setup script completed successfully.'
