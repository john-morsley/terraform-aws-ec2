#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  cluster_id = "kubernetes.io/cluster/${var.cluster_name}"

  name = "${var.name}-private-subnet"
  
//  merged_tags = merge(
//    { Name = local.name },
//    { "${cluster_id}" = "owned" },
//    var.tags
//  )
  
}