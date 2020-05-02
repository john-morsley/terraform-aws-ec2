#      ______    _____   ___  
#     |  ____|  / ____| |__ \ 
#     | |__    | |         ) |
#     |  __|   | |        / / 
#     | |____  | |____   / /_ 
#     |______|  \_____| |____|
#                         

resource "aws_instance" "this" {

  ami              = var.ami
  instance_type    = var.instance_type

  iam_instance_profile = var.iam_instance_profile_name

  subnet_id = var.public_subnet_id

  monitoring             = true
  
  tags = {
    Name = "${var.name}-ec2"
  }

}

# Note
# ====
# Terraform Resource: aws_instance
# https://www.terraform.io/docs/providers/aws/r/instance.html