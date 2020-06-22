#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  key_name = "${var.key_prefix}${var.key_prefix == "" ? "" : "-"}${local.name}"

  name = "${var.name}-ec2"

  merged_tags = merge(
    { Name = local.name },
    var.tags
  )

  shared_scripts_folder = "shared-scripts-${random_pet.shared-scripts.id}"

}