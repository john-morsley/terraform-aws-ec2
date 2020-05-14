#       _____   ____  
#      / ____| |___ \ 
#     | (___     __) |
#      \___ \   |__ < 
#      ____) |  ___) |
#     |_____/  |____/ 

# SIMPLE STORAGE SERVICE

module "public-key" {

  source = "./../terraform-aws-s3-object"
  #source = "john-morsley/terraform-aws-s3-object"

  bucket_name = var.bucket_name

  key     = "/${var.name}.pub"
  content = module.keys.public_key

  mock_depends_on = [
    var.mock_depends_on
  ]
  
}

module "private-key" {

  source = "./../terraform-aws-s3-object"
  #source = "john-morsley/terraform-aws-s3-object"

  bucket_name = var.bucket_name

  key     = "/${var.name}.pem"
  content = module.keys.private_key

  mock_depends_on = [
    var.mock_depends_on
  ]

}