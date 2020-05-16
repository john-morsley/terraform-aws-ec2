#     __      __        _       _     _           
#     \ \    / /       (_)     | |   | |          
#      \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#       \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#        \  / (_| | |  | | (_| | |_) | |  __/\__ \
#         \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}

variable "region" {
  type = string
  default = "eu-west-2" # London
}

variable "name" {
  type = string
  default = "rke-ec2-example"
}

variable "instance_type" {
  type = string
  default = "t2.medium" # Minimum for Docker
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16" # 65,531 (65,536 possible - 5 reserved by AWS) 
}

variable "public_subnet_cidr" {
  type = list(string)
  default = ["10.0.1.0/24"] # 251 (256 possible - 5 reserved by AWS) 
}

variable "private_subnet_cidr" {
  type = list(string)
  default = ["10.0.2.0/24"] # 251 (256 possible - 5 reserved by AWS) 
}