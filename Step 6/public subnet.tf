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