#     __      __  _____     _____
#     \ \    / / |  __ \   / ____|
#      \ \  / /  | |__) | | |     
#       \ \/ /   |  ___/  | |     
#        \  /    | |      | |____
#         \/     |_|       \_____|
#                             

module "vpc" {

  source = "./../../../terraform-aws-vpc"
  #source = "john-morsley/terraform-aws-vpc"

  name = "simple-ec2-example"

  cidr_block = "10.0.0.0/16" # 65,531 (65,536 possible - 5 reserved by AWS)

  public_subnets = ["10.0.0.0/24"] # 251 (256 possible - 5 reserved by AWS)

  tags = {
    Owner = "john-doe"
  }

}