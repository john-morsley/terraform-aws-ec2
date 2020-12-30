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

module "ec2-sg" {

  source = "./../terraform-aws-security-group-module"
  #source = "john-morsley/security-group/aws"

  name        = "${var.name}-sg"
  description = "EC2 related traffic."

  vpc_id = var.vpc_id
  
  tags = local.merged_tags
  
}

//module "allow-http-sg" {
//
//  source = "./../terraform-aws-security-group-module"
//  #source = "john-morsley/security-group/aws"
//
//  name        = "allow-http-${var.name}-sg"
//  description = "To allow HTTP."
//
//  vpc_id = var.vpc_id
//
//  tags = local.merged_tags
//
//}