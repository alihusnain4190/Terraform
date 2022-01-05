provider "aws"   {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami="ami-0ed9277fb7eb570c9"
  instance_type="t2.micro"
}

resource "aws_eip" "lb" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
}
resource "aws_security_group" "my_sg" {
  name        = "my_sg"
  description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
#   cidr_blocks = "${aws_eip.lb.public_ip}/32"
    cidr_blocks =["${aws_eip.lb.public_ip}/32"]
    # cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
}