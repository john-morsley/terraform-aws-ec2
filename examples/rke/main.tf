#      _____    _  __  ______ 
#     |  __ \  | |/ / |  ____|
#     | |__) | | ' /  | |__   
#     |  _  /  |  <   |  __|  
#     | | \ \  | . \  | |____ 
#     |_|  \_\ |_|\_\ |______|

module "rke-ec2" {

  source = "./../../../terraform-aws-ec2"

  name = local.name

  ami = data.aws_ami.ubuntu.id

  vpc_id = module.rke-vpc.id

  public_subnet_id = module.rke-vpc.public_subnet_id

  security_group_ids = [ module.allow-ssh.id ]

  tags = local.cluster_id_tag

  bucket_name = local.bucket_name
  
  mock_depends_on = [
    module.s3_bucket.id
  ]
  
}