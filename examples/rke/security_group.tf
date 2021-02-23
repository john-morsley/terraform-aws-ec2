#       _____                      _ _         
#      / ____|                    (_) |        
#     | (___   ___  ___ _   _ _ __ _| |_ _   _ 
#      \___ \ / _ \/ __| | | | '__| | __| | | |
#      ____) |  __/ (__| |_| | |  | | |_| |_| |
#     |_____/ \___|\___|\__,_|_|  |_|\__|\__, |
#            _____                        __/ |
#           / ____|                      |___/ 
#          | |  __ _ __ ___  _   _ _ __  
#          | | |_ | '__/ _ \| | | | '_ \ 
#          | |__| | | | (_) | |_| | |_) |
#           \_____|_|  \___/ \__,_| .__/ 
#                                 | |    
#                                 |_|     


module "allow-kube-api-sg" {

  source = "./../../../terraform-aws-security-group-module"
  #source = "john-morsley/security-group/aws"
  
  name        = "${var.name}-kube-api-sg"
  description = "KubeAPI related traffic."

  vpc_id = module.rke-vpc.id

  # See README for details.
  tags = local.cluster_id_tag

}