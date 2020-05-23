#      ______    _____   ___  
#     |  ____|  / ____| |__ \ 
#     | |__    | |         ) |
#     |  __|   | |        / / 
#     | |____  | |____   / /_ 
#     |______|  \_____| |____| 

module "simple-ec2" {

  source = "./../../../terraform-aws-ec2"
  //source = "john-morsley/ec2/aws"

  name = local.name

  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_id = module.simple-vpc.id

  #iam_instance_profile_name = module.iam.instance_profile_name

  public_subnet_id = module.simple-vpc.public_subnet_ids[0]

  security_group_ids = [ module.allow-ssh.id ]

  availability_zone = data.aws_availability_zones.available.names[0]
  
  bucket_name = local.bucket_name

  mock_depends_on = [
    module.s3_bucket
  ]
  
}