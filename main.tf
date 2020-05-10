#      ______    _____   ___  
#     |  ____|  / ____| |__ \ 
#     | |__    | |         ) |
#     |  __|   | |        / / 
#     | |____  | |____   / /_ 
#     |______|  \_____| |____|
#                         

# https://www.terraform.io/docs/providers/aws/r/instance.html

resource "aws_instance" "this" {

  ami = var.ami
  instance_type = var.instance_type

  iam_instance_profile = var.iam_instance_profile_name

  subnet_id = var.public_subnet_id

  monitoring = true

  security_groups = var.security_group_ids

  associate_public_ip_address = true
  
  key_name = module.keys.key_name
  
  tags = {
    Name = local.name
  }

}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "is-ec2-ready" {

  depends_on = [aws_instance.this]

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    #command = "chmod +x ${path.module}/is_ec2_ready.sh && bash ${path.module}/is_ec2_ready.sh ${local.name}"
    command = "bash ${path.module}/is_ec2_ready.sh ${local.name}"
  }

}