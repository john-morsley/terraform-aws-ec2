#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  key_name = "${var.key_prefix}${var.key_prefix == "" ? "" : "-"}${local.name}"

  name = "${var.name}-ec2"

  bucket_prefix = length(var.bucket_prefix) > 0 ? "${var.bucket_prefix}-" : ""
  bucket_name = "${local.bucket_prefix}${var.name}"
  
  merged_tags = merge(
    { Name = local.name },
    var.tags
  )

  merged_security_groups_ids = concat(
    tolist([module.ssh-ec2-sg.id]),
    var.additional_security_group_ids
  )

  shared_scripts_folder = "shared-scripts-${random_pet.shared-scripts.id}"

}