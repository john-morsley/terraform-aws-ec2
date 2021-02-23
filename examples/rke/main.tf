#      _____    _  __  ______ 
#     |  __ \  | |/ / |  ____|
#     | |__) | | ' /  | |__   
#     |  _  /  |  <   |  __|  
#     | | \ \  | . \  | |____ 
#     |_|  \_\ |_|\_\ |______|

module "rke-ec2" {
  
  source = "./../../../terraform-aws-ec2-module"
  //source = "john-morsley/ec2/aws"

  name = local.name

  ami = data.aws_ami.ubuntu.id

  instance_type = var.instance_type
  
  vpc_id = module.rke-vpc.id

  subnet_id = module.rke-vpc.public_subnet_ids[0]

  availability_zone = data.aws_availability_zones.available.names[0]

  additional_security_group_ids = [module.allow-kube-api-sg.id]

  iam_instance_profile_name = module.iam-role.instance_profile_name

  # See README for details.
  tags = local.cluster_id_tag
  
  enable_docker = true
  enable_ssh = true
  enable_ssm = true
  wait_until_ready = true
  
}