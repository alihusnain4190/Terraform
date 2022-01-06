provider "aws" {
  region="us-east-1"
}
resource "aws_instance" "myapp" {
ami =""
instance_type = "t2.micro"
key_name = "k8-key"
tags = {
  "Name" = "ali"
}
}