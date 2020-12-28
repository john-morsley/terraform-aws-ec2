#      _  __            _____      _      
#     | |/ /           |  __ \    (_)     
#     | ' / ___ _   _  | |__) |_ _ _ _ __ 
#     |  < / _ \ | | | |  ___/ _` | | '__|
#     | . \  __/ |_| | | |  | (_| | | |   
#     |_|\_\___|\__, | |_|   \__,_|_|_|   
#                __/ |                    
#               |___/                     

module "keys" {

  source = "./../terraform-aws-keys-module"
  #source = "john-morsley/keys/aws"

  name = local.key_name

  folder = "keys"

}