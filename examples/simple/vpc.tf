#     __      __  _____     _____
#     \ \    / / |  __ \   / ____|
#      \ \  / /  | |__) | | |     
#       \ \/ /   |  ___/  | |     
#        \  /    | |      | |____
#         \/     |_|       \_____|
#                             

module "simple-vpc" {

  source = "./../../../terraform-aws-vpc"
  //source = "john-morsley/vpc/aws"

  name = local.name

  vpc_cidr = "10.0.0.0/16" # 65,531 (65,536 possible - 5 reserved by AWS)

  public_subnet_cidrs = var.public_subnet_cidrs

  availability_zones = [data.aws_availability_zones.available.names[0]]

}