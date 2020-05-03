# Terraform an EC2 instance in AWS

## Examples

For examples how to use, please refer to the examples folder.

## Usage

```
module "ec2" {

  source = "john-morsley/aws-ec2"

  name = "example"

  tags = {
    Terraform = "true"
  }

}
```