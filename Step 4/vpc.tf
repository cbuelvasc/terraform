resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr_block
  tags = {
    Name = var.virginia_tags.Name
    name = var.virginia_tags.name
    env  = var.virginia_tags.env
  }
  provider = aws.virginia
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr_block
  tags = {
    Name = var.ohio_tags.Name
    name = var.ohio_tags.name
    env  = var.ohio_tags.env
  }
  provider = aws.ohio
}