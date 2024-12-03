variable "proxmox_host" {
  description = "The Proxmox host IP address"
  type        = string
}

variable "proxmox_user" {
  description = "The user to SSH into Proxmox"
  type        = string
}

variable "proxmox_password" {
  description = "The password for SSH user"
  type        = string
  sensitive   = true
}

variable "script_path" {
  description = "The local path to the script"
  type        = string
}

variable "vm_template_storage_name" {
  description = "The name of the storage where the VM templates will be stored"
  type        = string
}

# Variables for CentOS VM
variable "centos_image_file" {
  description = "The CentOS image file path"
  type        = string
}

variable "centos_image_url" {
  description = "The CentOS image download URL"
  type        = string
}

variable "centos_template_id" {
  description = "The CentOS VM template ID"
  type        = string
}

variable "centos_template_name" {
  description = "The CentOS VM template name"
  type        = string
}

# With sensitive = true output will be masked
variable "centos_template_password" {
  description = "The password for the CentOS VM template"
  type        = string
  # sensitive   = true
}

variable "centos_template_user" {
  description = "The user for the CentOS VM template"
  type        = string
}

# Variables for FCOS VM
variable "fcos_image_file" {
  description = "The FCOS image file path"
  type        = string
}

variable "fcos_image_url" {
  description = "The FCOS image download URL"
  type        = string
}

variable "fcos_template_id" {
  description = "The FCOS VM template ID"
  type        = string
}

variable "fcos_template_name" {
  description = "The FCOS VM template name"
  type        = string
}

variable "fcos_additional_flags" {
  description = "Additional flags for the FCOS VM creation"
  type        = string
}

variable "ssh_public_keys_src" {
  description = "The source path to the SSH public keys"
  type        = string
}
