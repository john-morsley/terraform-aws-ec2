#       ____        _               _       
#      / __ \      | |             | |      
#     | |  | |_   _| |_ _ __  _   _| |_ ___
#     | |  | | | | | __| '_ \| | | | __/ __|
#     | |__| | |_| | |_| |_) | |_| | |_\__ \
#      \____/ \__,_|\__| .__/ \__,_|\__|___/
#                      | |                  
#                      |_|

output "vpc_id" {
  value = module.rke-vpc.id
}

output "ec2_public_dns" {
  value = module.rke-ec2.public_dns
}


output "private_ip" {
  value = module.rke-ec2.private_ip
}

output "public_ip" {
  value = module.rke-ec2.public_ip
}
output "ssh_command" {
  value = module.rke-ec2.ssh_command
}