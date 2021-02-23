# Here we need to add an addition security group which connects the bastion host to the private server over SSH.

//module "bastion-to-server-ssh-sg" {
//
//  source = "./../../../terraform-aws-security-group-module"
//  #source = "john-morsley/security-group/aws"
//  
//  name        = "Bastion Host to Private Server"
//  description = "SSH related traffic for EC2 instance."
//
//  vpc_id = module.bastion-vpc.id
//  
//}
//
//resource "aws_security_group_rule" "bastion-to-server-ssh-sgr" {
//  
//  
//  
//}