resource "local_file" "ssh-config-file" {

  filename = "ssh/config"
  content = templatefile(
    "${path.module}/ssh_config.tpl",
    {
      bastion_pem       = "${abspath(path.module)}/keys/${module.bastion-ec2.key_name}.pem",
      bastion_user      = var.bastion_user,
      bastion_public_ip = module.bastion-ec2.public_ip,
      server_pem        = "${abspath(path.module)}/keys/${module.server-ec2.key_name}.pem",
      server_user       = var.server_user,
      server_private_ip = module.server-ec2.private_ip
  })

}