#       _____   ____  
#      / ____| |___ \ 
#     | (___     __) |
#      \___ \   |__ < 
#      ____) |  ___) |
#     |_____/  |____/ 

# SIMPLE STORAGE SERVICE

module "public-key" {

  count = var.enable_ssh ? 1 : 0
  
  source = "./../terraform-aws-s3-object-module"
  #source = "john-morsley/s3-object/aws"

  bucket_name = local.bucket_name

  key     = "/${var.name}.pub"
  content = module.keys[0].public_key

  depends_on = [
    module.s3_bucket[0]
  ]

}

module "private-key" {

  count = var.enable_ssh ? 1 : 0
  
  source = "./../terraform-aws-s3-object-module"
  #source = "john-morsley/s3-object/aws"

  bucket_name = local.bucket_name

  key     = "/${var.name}.pem"
  content = module.keys[0].private_key

  depends_on = [
    module.s3_bucket[0]
  ]

}