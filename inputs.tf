#      _____                   _       
#     |_   _|                 | |      
#       | |  _ __  _ __  _   _| |_ ___
#       | | | '_ \| '_ \| | | | __/ __|
#      _| |_| | | | |_) | |_| | |_\__ \
#     |_____|_| |_| .__/ \__,_|\__|___/
#             | |                  
#             |_|                  

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
  type = string
  default = "t2.nano"
}

variable "iam_instance_profile_name" {
  type = string
  default = null
}

variable "public_subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "tags" {
  description = "Additional tags for all resources"
  type        = map(string)
  default     = {}
}

variable "bucket_name" {
  type = string
}

variable "availability_zone" {
  description = "The Availability Zone for the instance"
  type        = string
}

variable "docker" {
  description = "Do we need Docker installed?"
  type        = bool
  default     = false
}

variable "mock_depends_on" {
  type    = any
  default = null
}