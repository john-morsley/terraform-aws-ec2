#       ____        _               _       
#      / __ \      | |             | |      
#     | |  | |_   _| |_ _ __  _   _| |_ ___
#     | |  | | | | | __| '_ \| | | | __/ __|
#     | |__| | |_| | |_| |_) | |_| | |_\__ \
#      \____/ \__,_|\__| .__/ \__,_|\__|___/
#                      | |                  
#                      |_|

output "name" {
  value = local.name
}

output "id" {
  value = aws_instance.this.id
}

output "shared_scripts_folder" {
  value = local.shared_scripts_folder
}

output "key_name" {
  value = var.enable_ssh ? local.key_name : "[SSH not enabled]"
}

output "merged_tags" {
  value = local.merged_tags
}

//output "key_pair" {
//  value = var.enable_ssh ? module.keys.key_pair[0] : "[SSH not enabled]"
//}

output "public_dns" {
  value = aws_instance.this.public_dns
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "private_dns" {
  value = aws_instance.this.private_ip
}

output "private_ip" {
  value = aws_instance.this.private_ip
}

//output "encoded_public_key" {
//  value = base64encode(module.keys.public_key)
//}
//
//output "encoded_private_key" {
//  value = base64encode(module.keys.private_key)
//}

output "ssh_command" {
  value = var.enable_ssh ? "chmod 400 keys/${local.key_prefix}${var.name}* && ssh -i keys/${local.key_prefix}${local.name}.pem ubuntu@${aws_instance.this.public_dns} -oStrictHostKeyChecking=no" : "[SSH not enabled]" 
}

output "s3_bucket_name" {
  value = var.enable_ssh ? local.bucket_name : "[SSH not enabled]"
}

output "security_group_warning" {
  value = var.enable_ssh == false && length(var.additional_security_group_ids) == 0 ? "[Must have at least one security group]" : "[OK]" 
}