#      ______    _____   ___  
#     |  ____|  / ____| |__ \ 
#     | |__    | |         ) |
#     |  __|   | |        / / 
#     | |____  | |____   / /_ 
#     |______|  \_____| |____| 

# https://www.terraform.io/docs/providers/aws/r/instance.html

resource "aws_instance" "this" {

  ami           = var.ami
  instance_type = var.instance_type

  iam_instance_profile = var.iam_instance_profile_name

  subnet_id = var.public_subnet_id

  monitoring = true

  associate_public_ip_address = true

  //key_name = module.keys.key_name
  key_name = local.key_name

  tags = local.merged_tags
  
  vpc_security_group_ids = local.merged_security_groups_ids
  
  availability_zone = var.availability_zone
  
  user_data = var.user_data
  
//  depends_on = [
//    module.ssh-ec2-sg
//  ]
  
}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "is-ec2-ready" {

  count = var.wait_until_ready ? 1 : 0
  
  depends_on = [
    null_resource.install-docker,
    null_resource.is-docker-ready,
    null_resource.get-shared-scripts,
    aws_instance.this
  ]

  # https://www.terraform.io/docs/provisioners/local-exec.html

  provisioner "local-exec" {
    command = "bash ${path.cwd}/${local.shared_scripts_folder}/aws/is_ec2_ready.sh ${local.name}"
  }

}