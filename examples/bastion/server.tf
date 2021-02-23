/*
  _____                          
 / ____|                         
| (___   ___ _ ____   _____ _ __ 
 \___ \ / _ \ '__\ \ / / _ \ '__|
 ____) |  __/ |   \ V /  __/ |   
|_____/ \___|_|    \_/ \___|_|   
                                  
*/

# A pretend server...

module "server-ec2" {

  source = "./../../../terraform-aws-ec2-module"
  //source = "john-morsley/ec2/aws"

  name = local.server_name

  ami           = data.aws_ami.ubuntu-server.id
  user          = var.server_user
  instance_type = var.server_instance_type

  vpc_id = module.bastion-vpc.id

  subnet_id = module.bastion-vpc.private_subnet_ids[0]

  availability_zone = data.aws_availability_zones.available.names[0]

  enable_ssh = true
  ssh_cidrs  = ["${module.bastion-ec2.private_ip}/32"]

}