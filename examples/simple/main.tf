#       _____ _                 _      
#      / ____(_)               | |     
#     | (___  _ _ __ ___  _ __ | | ___ 
#      \___ \| | '_ ` _ \| '_ \| |/ _ \
#      ____) | | | | | | | |_) | |  __/
#     |_____/|_|_| |_| |_| .__/|_|\___|
#                        | |           
#                        |_|           

module "ec2" {

  source = "./../../../terraform-aws-ec2"

  name = "example"

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  vpc_id = module.vpc.vpc_id

  iam_instance_profile_name = module.iam.instance_profile_name

  public_subnet_id = module.vpc.public_subnet_id

  security_group_ids      = module.vpc.security_group_ids

  //  tags = {
  //    "Terraform" = "true"
  //  }
  
}