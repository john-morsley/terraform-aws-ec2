#     __      __        _       _     _           
#     \ \    / /       (_)     | |   | |          
#      \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#       \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#        \  / (_| | |  | | (_| | |_) | |  __/\__ \
#         \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

variable "name" {
  type = string
}

variable "bastion_name" {
  type = string
}

variable "bastion_user" {
  type = string
}

variable "bastion_instance_type" {
  type    = string
  default = "t2.nano"
}

variable "server_name" {
  type = string
}

variable "server_user" {
  type = string
}

variable "server_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "bucket_prefix" {
  description = "An optional prefix for the bucket."
  type        = string
  default     = ""
}