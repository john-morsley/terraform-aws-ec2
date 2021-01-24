/*
 _    _                 _____        _        
| |  | |               |  __ \      | |       
| |  | |___  ___ _ __  | |  | | __ _| |_ __ _ 
| |  | / __|/ _ \ '__| | |  | |/ _` | __/ _` |
| |__| \__ \  __/ |    | |__| | (_| | || (_| |
 \____/|___/\___|_|    |_____/ \__,_|\__\__,_|
                                              
                                            */

data "template_file" "nginx_user_data" {
  template = file("nginx_user_data.tpl")
}

//module "web-servers" {
//
//  source = "./../terraform-aws-ec2-module"
//  //source = "john-morsley/ec2/aws"
//
//  count = var.number_of_web_servers
//  
//  name = "${local.name}-${count.index}"
//
//  ami           = data.aws_ami.ubuntu.id
//  instance_type = var.web_server_instance_type
//
//  vpc_id = module.vpc.id
//
//  public_subnet_id = module.vpc.public_subnet_ids[0]
//
//  availability_zone = data.aws_availability_zones.available.names[0]
//
//  bucket_prefix = var.domain
//  
//  user_data = data.template_file.user_data.rendered
//  
//  additional_security_group_ids = [
//    module.allow-web-traffic-sg.id
//    //aws_security_group.allow_tls.id
//  ]
//  
//}