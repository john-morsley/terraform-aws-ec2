#       _____   ____  
#      / ____| |___ \ 
#     | (___     __) |
#      \___ \   |__ < 
#      ____) |  ___) |
#     |_____/  |____/ 

# SIMPLE STORAGE SERVICE

resource "aws_s3_bucket_object" "public-key" {

  depends_on = [var.mock_depends_on]

  bucket     = var.bucket_name
  key        = "/${var.name}.pub"
  content    = module.keys.public_key
  content_type = "text/*"

}

resource "aws_s3_bucket_object" "private-key" {

  depends_on = [var.mock_depends_on]

  bucket     = var.bucket_name
  key        = "/${var.name}.pem"
  content    = module.keys.private_key
  content_type = "text/*"

}