resource "aws_instance" "public_instance" {
  ami           = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  depends_on = [
    aws_vpc.vpc_virginia,
    aws_subnet.public_subnet
  ]
  tags = {
    Name = "Public EC2 instance"
  }
  key_name = data.aws_key_pair.key.key_name
  provider = aws.virginia
}

resource "aws_instance" "private_instance" {
  ami           = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  depends_on = [
    aws_vpc.vpc_virginia,
    aws_subnet.private_subnet
  ]
  tags = {
    Name = "Private EC2 instance"
  }
  key_name = data.aws_key_pair.key.key_name
  provider = aws.virginia
}