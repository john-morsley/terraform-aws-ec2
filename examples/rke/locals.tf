﻿#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  cluster_id = "kubernetes.io/cluster/${var.cluster_name}"

  cluster_id_tag = {
    "${local.cluster_id}" = "owned"
  }
  
  all_cidr_block = "0.0.0.0/0" 

}