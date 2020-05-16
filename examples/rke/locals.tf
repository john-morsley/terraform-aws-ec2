#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  all_cidr_block = "0.0.0.0/0"

  bucket_name = "${var.name}-${random_pet.bucket.id}"
  
  cluster_id = "kubernetes.io/cluster/${random_pet.cluster-name.id}"

  cluster_id_tag = {
    "${local.cluster_id}" = "owned"
  }

  name = "${var.name}-${random_pet.name.id}"
  
}