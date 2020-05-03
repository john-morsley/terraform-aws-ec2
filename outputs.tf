#       ____        _               _       
#      / __ \      | |             | |      
#     | |  | |_   _| |_ _ __  _   _| |_ ___
#     | |  | | | | | __| '_ \| | | | __/ __|
#     | |__| | |_| | |_| |_) | |_| | |_\__ \
#      \____/ \__,_|\__| .__/ \__,_|\__|___/
#                      | |                  
#                      |_|

output "key_pair" {
  value = module.keys.key_pair
}

output "public_dns" {
  value = aws_instance.this.public_dns
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "private_dns" {
  value = aws_instance.this.private_ip
}

output "private_key" {
  value = module.keys.private_key_pem
}
# join("", tls_private_key.this.*.private_key_pem)

output "ssh_command" {
  value = "chmod 400 keys/${var.name}* && ssh -i \"keys/${var.name}.pem\" ubuntu@${aws_instance.this.public_dns}"
}