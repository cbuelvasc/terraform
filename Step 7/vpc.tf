resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr_block
  tags = {
    Name = "vpc_virginia-${local.suffix}"
  }
  provider = aws.virginia
}