resource "aws_security_group" "sg_public_instance" {
  name        = "Public Instance Security Group"
  description = "Allow HTTP and SSH inbound traffic and outbound traffic"
  vpc_id      = aws_vpc.vpc_virginia.id
  dynamic "ingress" {
    for_each = var.ingress_ports_list
    content {
      description = "Allow ingress traffic"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.sg_ingress_cidr]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.sg_ingress_cidr]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "public_instance_sg-${local.suffix}"
  }
  provider = aws.virginia
}