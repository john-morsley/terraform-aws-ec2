#      ______    _____   ___  
#     |  ____|  / ____| |__ \ 
#     | |__    | |         ) |
#     |  __|   | |        / / 
#     | |____  | |____   / /_ 
#     |______|  \_____| |____| 

module "ssm-ec2" {

  source = "./../../../terraform-aws-ec2-module"
  //source = "john-morsley/ec2/aws"

  name = local.name

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_id = module.ssm-vpc.id

  public_subnet_id = module.ssm-vpc.public_subnet_ids[0]

  availability_zone = data.aws_availability_zones.available.names[0]
  
  iam_instance_profile_name = module.ssm-iam.instance_profile_name
  
  enable_ssm = true
  
  //user_data = ""

}