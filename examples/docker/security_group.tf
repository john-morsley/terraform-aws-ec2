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
    cidr_blocks = var.public_subnet_cidr
  }]

  egress = [{
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.public_subnet_cidr
  }]
  
  #cidr_block = "10.0.0.0/16" # 65,531 (65,536 possible - 5 reserved by AWS)

  #public_subnets = ["10.0.0.0/24"] # 251 (256 possible - 5 reserved by AWS)

  #tags = {
  #  Owner = "john-doe"
  #}

}