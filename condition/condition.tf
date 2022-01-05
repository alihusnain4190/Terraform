provider "aws" {
  region = "us-east-1"
}

variable "cond" {}
locals {
  common_tags={
    Owner="Dev_Ops"
    service="backend"
  }
}
resource "aws_instance" "dev" {
   ami           = "ami-0ed9277fb7eb570c9"
   instance_type = "t2.micro"
  count = var.cond==true ? 1 : 0
  tags = local.common_tags
}
resource "aws_instance" "prod" {
   ami           = "ami-0ed9277fb7eb570c9"
   instance_type = "t2.larg"
   
  count = var.cond==false? 1:0
}