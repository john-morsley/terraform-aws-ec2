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


module "allow-ssh-sg" {

  source = "./../terraform-aws-security-group-module"
  #source = "john-morsley/security-group/aws"

  count = var.enable_ssh ? 1 : 0

  name        = "${var.name}-ssh"
  description = "SSH related traffic for EC2 instance."

  vpc_id = var.vpc_id
  
  tags = local.merged_tags
  
}

module "allow-ssm-sg" {

  source = "./../terraform-aws-security-group-module"
  #source = "john-morsley/security-group/aws"

  count = var.enable_ssm ? 1 : 0

  name        = "${var.name}-ssm"
  description = "SSM related traffic for EC2 instance."

  vpc_id = var.vpc_id

  tags = local.merged_tags

}

module "allow-internet-access-sg" {

  source = "./../terraform-aws-security-group-module"
  #source = "john-morsley/security-group/aws"

  name        = "allow-internet-access-${var.name}"
  description = "To allow the instance to access the Internet."

  vpc_id = var.vpc_id

  tags = local.merged_tags

}