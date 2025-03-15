output "ec2_public_ip" {
  description = "Public IP of the Public EC2 instance"
  value       = aws_instance.public_instance.public_ip
}

output "ec2_private_ip" {
  description = "Private IP of the private EC2 instance"
  value       = aws_instance.private_instance.private_ip
}