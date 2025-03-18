data "aws_key_pair" "key" {
  key_name = var.key_name //Before execute plan or apply is neccesary to create the key pair in the AWS console
}