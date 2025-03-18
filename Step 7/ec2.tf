resource "aws_instance" "public_instance" {
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  for_each               = var.instances
  depends_on = [
    aws_vpc.vpc_virginia,
    aws_subnet.public_subnet
  ]
  tags = {
    Name = "${each.value}-${local.suffix}"
  }
  lifecycle {

  }
  key_name  = data.aws_key_pair.key.key_name
  provider  = aws.virginia
  user_data = file("scripts/ec2-user-data.sh")
}

resource "aws_instance" "monitoring_instance" {
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  count                  = var.enable_monitoring ? 1 : 0
  depends_on = [
    aws_vpc.vpc_virginia,
    aws_subnet.public_subnet
  ]
  tags = {
    Name = "monitoring-${local.suffix}"
  }
  lifecycle {

  }
  key_name  = data.aws_key_pair.key.key_name
  provider  = aws.virginia
  user_data = file("scripts/ec2-user-data.sh")
}