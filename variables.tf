#     __      __        _       _     _           
#     \ \    / /       (_)     | |   | |          
#      \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#       \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#        \  / (_| | |  | | (_| | |_) | |  __/\__ \
#         \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

variable "vpc_id" {
  type = string
}

variable "name" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.nano"
}

variable "iam_instance_profile_name" {
  type    = string
  default = null
}

variable "public_subnet_id" {
  type = string
}

variable "additional_security_group_ids" {
  type = list(string)
  default = []
}

variable "tags" {
  description = "Additional tags for all resources."
  type        = map(string)
  default     = {}
}

variable "key_prefix" {
  type    = string
  default = ""
}

variable "availability_zone" {
  description = "The Availability Zone for the instance."
  type        = string
}

variable "enable_docker" {
  description = "Do we need Docker installed?"
  type        = bool
  default     = false
}

variable "enable_ssh" {
  description = "Do we need SSH access? (optional, but required for Docker)"
  type        = bool
  default     = false
}

variable "enable_ssm" {
  description = "Do we need SSM access? (optional)"
  type        = bool
  default     = false
}

variable "bucket_prefix" {
  description = "An optional prefix for the bucket."
  type        = string
  default     = ""
}

variable "user_data" {
  description = "User data for the instance (optional)."
  type        = string
  default     = ""
}

variable "wait_until_ready" {
  description = "Do we wait until this instance is ready? (optional)"
  type = bool
  default = false
}