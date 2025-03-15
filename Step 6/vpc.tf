resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr_block
  tags = {
    Name = "VPC Virginia"
  }
  provider = aws.virginia
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.public_subnet
  map_public_ip_on_launch = true
  depends_on = [
    aws_vpc.vpc_virginia
  ]
  tags = {
    "Name" = "Public Subnet"
  }
  provider = aws.virginia
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.private_subnet
  tags = {
    "Name" = "Private Subnet"
  }
  depends_on = [
    aws_vpc.vpc_virginia,
    aws_subnet.public_subnet
  ]
  provider = aws.virginia
}