#     __      __  _____     _____
#     \ \    / / |  __ \   / ____|
#      \ \  / /  | |__) | | |     
#       \ \/ /   |  ___/  | |     
#        \  /    | |      | |____
#         \/     |_|       \_____|

module "docker-vpc" {

  source = "john-morsley/vpc/aws"

  name = local.name

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs = var.public_subnet_cidr
  private_subnet_cidrs = var.private_subnet_cidr
  
}