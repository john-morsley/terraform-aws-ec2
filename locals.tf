#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  key_prefix = "${var.key_prefix}${var.key_prefix == "" ? "" : "-"}"
  
  key_name = var.enable_ssh ? "${local.key_prefix}${local.name}" : ""

  name = "${var.name}-ec2"

  bucket_prefix = length(var.bucket_prefix) > 0 ? "${var.bucket_prefix}-" : ""
  bucket_name = "${local.bucket_prefix}${var.name}"
  
  merged_tags = merge(
    { Name = local.name },
    var.tags
  )

  //ssh_sg = []
  ssh_sg = var.enable_ssh ? tolist([module.allow-ssh-sg[0].id]) : []
  
  merged_security_groups_ids = concat(
    local.ssh_sg,
    var.additional_security_group_ids
  )

  //key_name = module.keys.key_name
  //key_name = var.enable_ssh ? module.keys[0].key_name : ""
  
  shared_scripts_folder = "shared-scripts-${random_pet.shared-scripts.id}"

}