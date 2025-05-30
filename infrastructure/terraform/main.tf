resource "tls_private_key" "generated" {
  algorithm = "ED25519"
  count = 1
}

resource "local_file" "private_key" {
  depends_on = [tls_private_key.generated]
  content  = tls_private_key.generated[0].private_key_pem
  filename = "${path.module}/../keys/tf-generated-tls-key.key"
}

resource "local_file" "public_key" {
  depends_on = [tls_private_key.generated]
  content  = tls_private_key.generated[0].public_key_openssh
  filename = "${path.module}/../keys/tf-generated-tls-key.key.pub"
}

locals {
  private_key_pem = fileexists("${path.module}/../keys/tf-generated-tls-key.key") ? file("${path.module}/../keys/tf-generated-tls-key.key") : tls_private_key.generated[0].private_key_pem
  public_key_openssh = fileexists("${path.module}/../keys/tf-generated-tls-key.key.pub") ? file("${path.module}/../keys/tf-generated-tls-key.key.pub") : tls_private_key.generated[0].public_key_openssh
}

resource "null_resource" "distribute_key" {
  depends_on = [local_file.private_key, local_file.public_key]

  count = length(tls_private_key.generated) > 0 ? 1 : 0

  provisioner "remote-exec" {
    inline = [
      "mkdir -p ~/.ssh",
      "echo '${tls_private_key.generated[0].public_key_openssh}' >> ~/.ssh/authorized_keys",
      "chmod 600 ~/.ssh/authorized_keys"
    ]

    connection {
      type        = "ssh"
      host        = var.proxmox_host
      user        = var.proxmox_user
      password    = var.proxmox_password
    }
  }
}

resource "null_resource" "copy_script" {
  depends_on = [null_resource.distribute_key]

  provisioner "remote-exec" {
    inline = [
      "mkdir -p ~/scripts",
      "echo '${file("${path.module}/${var.script_path}")}' > ~/scripts/createCustomizedTemplateVM.sh", 
      "chmod +x ~/scripts/createCustomizedTemplateVM.sh" 
    ]

    connection {
      type        = "ssh"
      host        = var.proxmox_host
      user        = var.proxmox_user
      private_key = local.private_key_pem
    }
  }
}

# Resource for creating CentOS VM template
resource "null_resource" "create_centos_template" {
  depends_on = [null_resource.copy_script]

  provisioner "remote-exec" {
    inline = [
      "mkdir -p ~/scripts",
      "echo '${file("${path.module}/${var.ssh_public_keys_src}")}' > ~/scripts/ssh-pub-keys.key",
      "~/scripts/createCustomizedTemplateVM.sh --image-file '${var.centos_image_file}' --image-url '${var.centos_image_url}' --template-id '${var.centos_template_id}' --template-name '${var.centos_template_name}' --template-pass '${var.centos_template_password}' --template-user '${var.centos_template_user}' --template-storage-name '${var.vm_template_storage_name}' --ssh-public-keys ~/scripts/ssh-pub-keys.key"
    ]

    connection {
      type        = "ssh"
      host        = var.proxmox_host
      user        = var.proxmox_user
      private_key = local.private_key_pem
    }
  }
}

# Resource for creating FCOS VM template
resource "null_resource" "create_fcos_template" {
  depends_on = [null_resource.copy_script]

  provisioner "remote-exec" {
    inline = [
      "~/scripts/createCustomizedTemplateVM.sh --image-file '${var.fcos_image_file}' --image-url '${var.fcos_image_url}' --template-id '${var.fcos_template_id}' --template-name '${var.fcos_template_name}' --template-storage-name '${var.vm_template_storage_name}' ${var.fcos_additional_flags}"
    ]

    connection {
      type        = "ssh"
      host        = var.proxmox_host
      user        = var.proxmox_user
      private_key = local.private_key_pem
    }
  }
}
