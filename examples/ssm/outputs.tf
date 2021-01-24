#       ____        _               _       
#      / __ \      | |             | |      
#     | |  | |_   _| |_ _ __  _   _| |_ ___
#     | |  | | | | | __| '_ \| | | | __/ __|
#     | |__| | |_| | |_| |_) | |_| | |_\__ \
#      \____/ \__,_|\__| .__/ \__,_|\__|___/
#                      | |                  
#                      |_|

output "ec2_name" {
  value = module.ssm-ec2.name
}

output "ec2_id" {
  value = module.ssm-ec2.id
}

output "ec2_shared_scripts_folder" {
  value = module.ssm-ec2.shared_scripts_folder
}

output "ec2_key_name" {
  value = module.ssm-ec2.key_name
}

output "ec2_merged_tags" {
  value = module.ssm-ec2.merged_tags
}

//output "ec2_key_pair" {
//  value = module.ssm-ec2.key_pair
//}

output "ec2_public_dns" {
  value = module.ssm-ec2.public_dns
}

output "ec2_public_ip" {
  value = module.ssm-ec2.public_ip
}

output "ec2_private_dns" {
  value = module.ssm-ec2.private_dns
}

output "ec2_private_ip" {
  value = module.ssm-ec2.private_ip
}

output "ec2_ssh_command" {
  value = module.ssm-ec2.ssh_command
}

output "vpc_id" {
  value = module.ssm-vpc.id
}

output "ec2_s3_bucket_name" {
  value = module.ssm-ec2.s3_bucket_name
}