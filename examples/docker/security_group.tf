﻿#       _____                      _ _         
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

module "allow-ssh" {

  source = "./../../../terraform-aws-security-group"
  #source = "john-morsley/terraform-aws-vpc"

  name = "docker"
  description = "To allow SSH to set up Docker."

  vpc_id = module.vpc.vpc_id
  
  ingress = [{
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.all_cidr_block
  }]

  egress = [{
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.all_cidr_block
  }]
  
  #tags = {
  #  Owner = "john-doe"
  #}

}