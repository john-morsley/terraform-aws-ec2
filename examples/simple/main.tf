#      ______                           _      
#     |  ____|                         | |     
#     | |__  __  ____ _ _ __ ___  _ __ | | ___ 
#     |  __| \ \/ / _` | '_ ` _ \| '_ \| |/ _ \
#     | |____ >  < (_| | | | | | | |_) | |  __/
#     |______/_/\_\__,_|_| |_| |_| .__/|_|\___|
#                                | |           
#                                |_|           
#

module "ec2" {

  source = "./../../../terraform-aws-ec2"

  name = "example"

  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  vpc_id = module.vpc.vpc_id

  iam_instance_profile_name = module.iam.instance_profile_name

  public_subnet_id = module.vpc.public_subnet_id

  #security_group_ids = module.vpc.security_group_ids

  //  tags = {
  //    "Terraform" = "true"
  //  }
  
}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "is-ec2-ready" {

  depends_on = [module.ec2]

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "chmod +x is_ec2_ready.sh && bash is_ec2_ready.sh ${module.ec2.name}"
  }

}