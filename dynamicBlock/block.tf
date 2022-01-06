provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "my_ec2" {
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"

}


variable "sg_ports" {
  type        = list(number)
  description = "this is a security group port"
  default     = [8201, 8202, 8203, 8204, 8205]
}



resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
    iterator=port
  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  #    ingress {
  #     from_port   = 8201
  #     to_port     = 8201
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  #    ingress {
  #     from_port   = 8202
  #     to_port     = 8202
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  #    ingress {
  #     from_port   = 8203
  #     to_port     = 8203
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  #    ingress {
  #     from_port   = 8204
  #     to_port     = 8204
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  #    ingress {
  #     from_port   = 8205
  #     to_port     = 8205
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
}