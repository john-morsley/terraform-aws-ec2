#       ____        _               _       
#      / __ \      | |             | |      
#     | |  | |_   _| |_ _ __  _   _| |_ ___
#     | |  | | | | | __| '_ \| | | | __/ __|
#     | |__| | |_| | |_| |_) | |_| | |_\__ \
#      \____/ \__,_|\__| .__/ \__,_|\__|___/
#                      | |                  
#                      |_|

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "key_pair" {
  value = module.ec2.key_pair
}

output "ec2_public_dns" {
  value = module.ec2.public_dns
}

output "ssh_command" {
  value = module.ec2.ssh_command
}