# Extension Idea 
# Refactor the script below by separating logic per resource to enable more granular and modular infrastructure provisioning.
# - separated for every null resource and invoked on "when = destroy"

# resource "local_file" "cleanup_info" {
#   content  = <<EOT
#     PROXMOX_HOST=${var.proxmox_host}
#     PROXMOX_USER=${var.proxmox_user}
#     PRIVATE_KEY=${path.module}/../keys/tf-generated-tls-key.key
#     CENTOS_TEMPLATE_ID=${var.centos_template_id}
#     FCOS_TEMPLATE_ID=${var.fcos_template_id}
#     CENTOS_IMAGE_FILE=${var.centos_image_file}
#     FCOS_IMAGE_FILE=${var.fcos_image_file}
#     SCRIPT_PATH=~/scripts/createCustomizedTemplateVM.sh
#   EOT
#   filename = "${path.module}/../scripts/cleanup_info.sh"
# }

# resource "null_resource" "cleanup" {
#   depends_on = [local_file.cleanup_info, null_resource.copy_script, null_resource.create_centos_template, null_resource.create_fcos_template]

#   provisioner "local-exec" {
#     command = <<EOT
#       bash -c 'source ${path.module}/../scripts/cleanup_info.sh && \
#       ${path.module}/../scripts/cleanup.sh $PROXMOX_HOST $PROXMOX_USER $PRIVATE_KEY \
#       $CENTOS_TEMPLATE_ID $FCOS_TEMPLATE_ID $CENTOS_IMAGE_FILE $FCOS_IMAGE_FILE $SCRIPT_PATH'
#     EOT
#     when    = destroy
#   }
# }
