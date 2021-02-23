# This should work.
//output "bastion_ssh_command" {
//  value = module.bastion-ec2.ssh_command
//}

# This should fail.
//output "server_ssh_command" {
//  value = module.server-ec2.ssh_command
//}

//output "move_ssh_config_command" {
//  value = ""
//}

output "absolute_path" {
  value = abspath(path.module)
}