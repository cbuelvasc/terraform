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