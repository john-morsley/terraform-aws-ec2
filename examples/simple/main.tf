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

  name = "example-normal"

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  vpc_id = module.vpc.vpc_id

  iam_instance_profile_name = module.iam.instance_profile_name

  public_subnet_id = module.vpc.public_subnet_id

  //subnet_id     = tolist(data.aws_subnet_ids.all.ids)[0]
  //  private_ips                 = ["172.31.32.5", "172.31.46.20"]
  #vpc_security_group_ids      = [module.security_group.this_security_group_id]
  #associate_public_ip_address = true
  #placement_group             = aws_placement_group.web.id

  #user_data_base64 = base64encode(local.user_data)

  #root_block_device = [
  #  {
  #    volume_type = "gp2"
  #    volume_size = 10
  #  },
  #]

  #ebs_block_device = [
  #  {
  #    device_name = "/dev/sdf"
  #    volume_type = "gp2"
  #    volume_size = 5
  #    encrypted   = true
  #    kms_key_id  = aws_kms_key.this.arn
  #  }
  #]

  //  tags = {
  //    "Terraform" = "true"
  //  }

}