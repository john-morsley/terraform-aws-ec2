#      ______    _____   ___  
#     |  ____|  / ____| |__ \ 
#     | |__    | |         ) |
#     |  __|   | |        / / 
#     | |____  | |____   / /_ 
#     |______|  \_____| |____| 

# https://www.terraform.io/docs/providers/aws/r/instance.html

resource "aws_instance" "this" {

  ami = var.ami
  instance_type = var.instance_type

  iam_instance_profile = var.iam_instance_profile_name

  subnet_id = var.public_subnet_id

  monitoring = true
  
  associate_public_ip_address = true
  
  key_name = module.keys.key_name
  
  tags = local.merged_tags

  vpc_security_group_ids = var.security_group_ids
  
  availability_zone = var.availability_zone
  
  depends_on = [
    var.mock_depends_on
  ]
  
}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "is-ec2-ready" {

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