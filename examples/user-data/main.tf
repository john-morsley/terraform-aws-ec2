#      ______    _____   ___  
#     |  ____|  / ____| |__ \ 
#     | |__    | |         ) |
#     |  __|   | |        / / 
#     | |____  | |____   / /_ 
#     |______|  \_____| |____| 

module "web-server-ec2" {

  source = "./../../../terraform-aws-ec2-module"
  //source = "john-morsley/ec2/aws"

  name = local.name

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_id = module.web-server-vpc.id

  subnet_id = module.web-server-vpc.public_subnet_ids[0]

  availability_zone = data.aws_availability_zones.available.names[0]

  enable_ssh = true
  enable_ssm = true

  user_data = data.template_file.nginx_user_data.rendered
  
  additional_security_group_ids = [
    module.allow-web-traffic-sg.id
  ]
  
  wait_until_ready = true
  
}