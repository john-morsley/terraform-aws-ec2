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

//module "allow-kube-api-ingress-sgr" {
//
//  source = "./../../../terraform-aws-security-group-rule-module"
//  #source = "john-morsley/security-group-rule/aws"
//  
//  description = "Ingress for SSH."
//
//  security_group_id = module.allow-kube-api-sg.id
//
//  type      = "ingress"
//  from_port = 6443
//  to_port   = 6443
//  
//  protocol  = "tcp"
//  cidrs     = ["0.0.0.0/0"]
//
//}

module "allow-kube-api-ingress-sgr" {

  source = "./../../../terraform-aws-security-group-rule-module"
  #source = "john-morsley/security-group-rule/aws"

  description = "Ingress for RKE."

  security_group_id = module.allow-kube-api-sg.id

  type      = "ingress"
  from_port = 0
  to_port   = 65535

  protocol  = "tcp"
  cidrs     = ["0.0.0.0/0"]

}

  module "allow-kube-api-egress-sgr" {

  source = "./../../../terraform-aws-security-group-rule-module"
  #source = "john-morsley/security-group-rule/aws"

  description = "Egress for RKE."

  security_group_id = module.allow-kube-api-sg.id

  type      = "egress"
  from_port = 0
  to_port   = 65535

  protocol  = "tcp"
  cidrs     = ["0.0.0.0/0"]

}