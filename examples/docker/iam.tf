#      _____              __  __ 
#     |_   _|     /\     |  \/  |
#       | |      /  \    | \  / |
#       | |     / /\ \   | |\/| |
#      _| |_   / ____ \  | |  | |
#     |_____| /_/    \_\ |_|  |_|
#                            

# Identity & Access Management 

module "iam" {

  source = "john-morsley/iam/aws"

  name = "ec2"

  assume_role_policy = file("${path.module}/role.json")

  role_policy = file("${path.module}/policy.json")

}