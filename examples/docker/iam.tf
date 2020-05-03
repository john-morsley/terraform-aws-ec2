#      _____              __  __ 
#     |_   _|     /\     |  \/  |
#       | |      /  \    | \  / |
#       | |     / /\ \   | |\/| |
#      _| |_   / ____ \  | |  | |
#     |_____| /_/    \_\ |_|  |_|
#                            

# Identity & Access Management 

module "iam" {

  source = "./../../../terraform-aws-iam"
  // #source = "john-morsley/terraform-aws-iam"

  name = "ec2"

  assume_role_policy = file("${path.module}/role.json")

  role_policy = file("${path.module}/policy.json")

}
