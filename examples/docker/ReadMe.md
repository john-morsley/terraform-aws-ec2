# Docker EC2

In this example we will create a simple EC2 instance, complete with Docker.

What constitutes an EC2 instance?

The assumption here is that this is the minimal EC2 instance possible and 
therefore consists of:

1 - A simple VPC (via our VPC plugin)
2 - An IAM instance profile 
3 - An EC2 instance
3 - Private and public keys
4 - Docker is installed
5 - 