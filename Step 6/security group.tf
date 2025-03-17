resource "aws_security_group" "sg_public_instance" {
  name        = "Public Instance Security Group"
  description = "Allow HTTP and SSH inbound traffic and outbound traffic"
  vpc_id      = aws_vpc.vpc_virginia.id
  ingress {
    description = "Allow SSH inbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }
  ingress {
    description = "Allow HTTP inbound traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }
  ingress {
    description = "Allow HTTP inbound traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.sg_ingress_cidr]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "Public Instance Security Group"
  }
  provider = aws.virginia
}