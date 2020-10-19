#       _____   ____  
#      / ____| |___ \ 
#     | (___     __) |
#      \___ \   |__ < 
#      ____) |  ___) |
#     |_____/  |____/ 

# SIMPLE STORAGE SERVICE

module "public-key" {

  source = "./../terraform-aws-s3-object"
  #source = "john-morsley/s3-object/aws"

  bucket_name = local.bucket_name

  key     = "/${var.name}.pub"
  content = module.keys.public_key

  depends_on = [
    module.s3_bucket
  ]

}

module "private-key" {

  source = "./../terraform-aws-s3-object"
  #source = "john-morsley/s3-object/aws"

  bucket_name = local.bucket_name

  key     = "/${var.name}.pem"
  content = module.keys.private_key

  depends_on = [
    module.s3_bucket
  ]

}