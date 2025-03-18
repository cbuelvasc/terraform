resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id
  tags = {
    Name = "igw_vpc_virginia-${local.suffix}"
  }
  provider = aws.virginia
}