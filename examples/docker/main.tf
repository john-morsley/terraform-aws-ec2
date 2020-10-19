#      _____             _
#     |  __ \           | |
#     | |  | | ___   ___| | _____ _ __
#     | |  | |/ _ \ / __| |/ / _ \ '__|
#     | |__| | (_) | (__|   <  __/ |
#     |_____/ \___/ \___|_|\_\___|_|

module "docker-ec2" {

  source = "./../../../terraform-aws-ec2"
  //source = "john-morsley/ec2/aws"

  name = local.name

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_id = module.docker-vpc.id

  iam_instance_profile_name = module.iam.instance_profile_name

  public_subnet_id = module.docker-vpc.public_subnet_ids[0]

  availability_zone = data.aws_availability_zones.available.names[0]

  docker = true
  
}