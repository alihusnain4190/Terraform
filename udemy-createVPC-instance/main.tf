terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    "Name" = "my_vpc"
  }
}

module "my_subnet" {
  source             = "./modules/Subnet/"
  my_vpc_id          = aws_vpc.my_vpc.id
  cidr_block_public  = var.cidr_block_public
  cidr_block_private = var.cidr_block_private
  cidr_route_table   = var.cidr_route_table
  az_public          = var.az_public
  az_private         = var.az_private
}
