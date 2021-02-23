#       _____                      _ _         
#      / ____|                    (_) |        
#     | (___   ___  ___ _   _ _ __ _| |_ _   _ 
#      \___ \ / _ \/ __| | | | '__| | __| | | |
#      ____) |  __/ (__| |_| | |  | | |_| |_| |
#     |_____/ \___|\___|\__,_|_|  |_|\__|\__, |
#            _____                        __/ |
#           / ____|                      |___/ 
#          | |  __ _ __ ___  _   _ _ __  
#          | | |_ | '__/ _ \| | | | '_ \ 
#          | |__| | | | (_) | |_| | |_) |
#           \_____|_|  \___/ \__,_| .__/ 
#                _____       _    | |  
#               |  __ \     | |   |_|  
#               | |__) |   _| | ___ 
#               |  _  / | | | |/ _ \
#               | | \ \ |_| | |  __/
#               |_|  \_\__,_|_|\___|

module "allow-ssh-ingress-sgr" {

  source = "./../terraform-aws-security-group-rule-module"
  #source = "john-morsley/security-group-rule/aws"

  count = var.enable_ssh ? 1 : 0

  description = "Ingress for SSH."

  security_group_id = module.allow-ssh-sg[0].id

  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"
  //cidrs     = ["0.0.0.0/0"]
  cidrs = var.ssh_cidrs

}

module "allow-ssm-egress-sgr" {

  source = "./../terraform-aws-security-group-rule-module"
  #source = "john-morsley/security-group-rule/aws"

  count = var.enable_ssm ? 1 : 0

  description = "Egress for SSM."

  security_group_id = module.allow-ssm-sg[0].id

  type      = "egress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"
  cidrs     = ["0.0.0.0/0"]

}

module "allow-internet-access-egress-sgr" {
  
  source = "./../terraform-aws-security-group-rule-module"
  #source = "john-morsley/security-group-rule/aws"

  description = "Egress for Internet."

  security_group_id = module.allow-internet-access-sg.id

  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"
  cidrs     = ["0.0.0.0/0"]

}

//module "allow-ssh-ingress-sgr" {
//
//  source = "./../terraform-aws-security-group-rule-module"
//  #source = "john-morsley/security-group-rule/aws"
//
//  description = "SSH Ingress."
//
//  security_group_id = module.ssh-ec2-sg.id
//
//  type      = "ingress"
//  from_port = 0
//  to_port   = 0
//  protocol  = "-1"
//  cidrs     = ["0.0.0.0/0"]
//
//}


//module "allow-http-ingress-sgr" {
//
//  source = "./../terraform-aws-security-group-rule-module"
//  #source = "john-morsley/security-group-rule/aws"
//
//  description = "HTTP Ingress."
//
//  security_group_id = module.allow-http-sg.id
//
//  type      = "ingress"
//  from_port = 80
//  to_port   = 80
//  protocol  = "tcp"
//  cidrs     = ["0.0.0.0/0"]
//
//}
//
//module "allow-http-egress-sgr" {
//
//  source = "./../terraform-aws-security-group-rule-module"
//  #source = "john-morsley/security-group-rule/aws"
//
//  description = "Egress for HTTP."
//
//  security_group_id = module.allow-http-sg.id
//
//  type      = "egress"
//  from_port = 0
//  to_port   = 0
//  protocol  = "-1"
//  cidrs     = ["0.0.0.0/0"]
//
//}

