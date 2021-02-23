/*
            __  __   _____
    /\     |  \/  | |_   _|
   /  \    | \  / |   | |
  / /\ \   | |\/| |   | |
 / ____ \  | |  | |  _| |_
/_/    \_\ |_|  |_| |_____|

*/

# Amazon Machine Image


# Ubuntu...
data "aws_ami" "ubuntu-server" {

  most_recent = true

  owners = ["099720109477"] # Canonical

  # The latest LTS version...
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  # The recommendation is to use HVM:
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

# Amazon...
data "aws_ami" "amazon-linux-2" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  # The recommendation is to use HVM:
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}


# Note
# ====

# Linux AMI virtualization types:
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/virtualization_types.html

# Amazon EC2 AMI Locator:
# https://cloud-images.ubuntu.com/locator/ec2/