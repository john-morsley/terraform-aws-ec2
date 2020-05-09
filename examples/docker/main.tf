#      _____             _
#     |  __ \           | |
#     | |  | | ___   ___| | _____ _ __
#     | |  | |/ _ \ / __| |/ / _ \ '__|
#     | |__| | (_) | (__|   <  __/ |
#     |_____/ \___/ \___|_|\_\___|_|

module "ec2" {

  source = "./../../../terraform-aws-ec2"

  name = "docker"

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_id = module.vpc.vpc_id

  iam_instance_profile_name = module.iam.instance_profile_name

  public_subnet_id = module.vpc.public_subnet_id

  #security_group_ids = module.vpc.security_group_ids

  //  tags = {
  //    "Terraform" = "true"
  //  }

}