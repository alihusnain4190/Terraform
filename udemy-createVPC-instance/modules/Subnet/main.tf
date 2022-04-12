resource "aws_subnet" "public_subnet" {
  vpc_id     = var.my_vpc_id
  cidr_block = var.cidr_block_public

  availability_zone       = var.az_public
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id            = var.my_vpc_id
  cidr_block        = var.cidr_block_private
  availability_zone = var.az_private
  tags = {
    "Name" = "private_subnet"
  }
}

resource "aws_internet_gateway" "my_gw" {
  vpc_id = var.my_vpc_id
  tags = {
    Name = "my_internet_gateway"
  }
}
resource "aws_route_table" "public_route_table" {
  vpc_id = var.my_vpc_id
  route {
    cidr_block = var.cidr_route_table
    gateway_id = aws_internet_gateway.my_gw.id
  }
  tags = {
    "Name" = "public_route"
  }
}
resource "aws_route_table" "private_route_table" {
  vpc_id = var.my_vpc_id
  tags = {
    "Name" = "private_route"
  }
}
resource "aws_route_table_association" "public_route_associate" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_associate" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}