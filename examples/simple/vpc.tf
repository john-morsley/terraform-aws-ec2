#     __      __  _____     _____
#     \ \    / / |  __ \   / ____|
#      \ \  / /  | |__) | | |     
#       \ \/ /   |  ___/  | |     
#        \  /    | |      | |____
#         \/     |_|       \_____|
#                             

module "simple-vpc" {

  source = "john-morsley/vpc/aws"

  name = local.name

  vpc_cidr = "10.0.0.0/16" # 65,531 (65,536 possible - 5 reserved by AWS)

  public_subnet_cidrs = ["10.0.1.0/24"] # 251 (256 possible - 5 reserved by AWS)
  private_subnet_cidrs = ["10.0.2.0/24"] # 251 (256 possible - 5 reserved by AWS)

  availability_zone = data.aws_availability_zones.available.names[0]
  
}