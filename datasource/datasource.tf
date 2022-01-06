provider "aws" {
  region = var.region
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_instance" "app_ec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type
}