resource "aws_instance" "public_instance" {
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  depends_on = [
    aws_vpc.vpc_virginia,
    aws_subnet.public_subnet
  ]
  tags = {
    Name = "Public EC2 instance"
  }
  lifecycle {

  }
  key_name = data.aws_key_pair.key.key_name
  provider = aws.virginia
  provisioner "local-exec" {
    command = "echo instance created with IP ${aws_instance.public_instance.public_ip} >> instance_ip.txt"

  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo instance destroyed with IP ${self.public_ip} >> instance_ip.txt"
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("DemoKeyPair.pem")
  }
  provisioner "file" {
    source      = "scripts/ec2-user-data.sh"
    destination = "/tmp/ec2-user-data.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/ec2-user-data.sh",
      "sudo /tmp/ec2-user-data.sh"
    ]
  }
}

resource "aws_instance" "public_instance_2" {
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  depends_on = [
    aws_vpc.vpc_virginia,
    aws_subnet.public_subnet
  ]
  tags = {
    Name = "Public EC2 instance 2"
  }
  lifecycle {

  }
  key_name  = data.aws_key_pair.key.key_name
  provider  = aws.virginia
  user_data = file("scripts/ec2-user-data.sh")
  provisioner "local-exec" {
    command = "echo instance created with IP ${aws_instance.public_instance_2.public_ip} >> instance_ip.txt"

  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo instance destroyed with IP ${self.public_ip} >> instance_ip.txt"
  }
}

resource "aws_instance" "private_instance" {
  ami           = var.ec2_specs.ami
  instance_type = var.ec2_specs.instance_type
  subnet_id     = aws_subnet.private_subnet.id
  depends_on = [
    aws_vpc.vpc_virginia,
    aws_subnet.private_subnet
  ]
  tags = {
    Name = "Private EC2 instance"
  }
  lifecycle {

  }
  key_name = data.aws_key_pair.key.key_name
  provider = aws.virginia
}