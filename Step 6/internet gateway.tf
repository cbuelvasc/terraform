resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id
  tags = {
    Name = "IGW VPC Virginia"
  }
  provider = aws.virginia
}