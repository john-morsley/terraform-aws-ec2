#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  all_cidr_block = "0.0.0.0/0"

  name         = "${var.name}-${random_pet.name.id}"
  bastion_name = "${var.bastion_name}-${random_pet.name.id}"
  server_name  = "${var.server_name}-${random_pet.name.id}"

}