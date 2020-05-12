#     __      __  _____     _____
#     \ \    / / |  __ \   / ____|
#      \ \  / /  | |__) | | |     
#       \ \/ /   |  ___/  | |     
#        \  /    | |      | |____
#         \/     |_|       \_____|

module "rke-vpc" {

  source = "./../../../terraform-aws-vpc"
  #source = "john-morsley/terraform-aws-vpc"

  name = "docker-ec2-example"

  cidr_block = var.cidr_block

  public_subnets = var.public_subnet_cidr

  tags = {
    Owner = "john-doe"
  }

}