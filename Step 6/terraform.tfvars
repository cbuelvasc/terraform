virginia_cidr_block = "10.10.0.0/16"
public_subnet       = "10.10.0.0/24"
private_subnet      = "10.10.1.0/24"
subnets             = ["10.10.0.0/24", "10.10.1.0/24"]
tags = {
  name        = "Lab"
  env         = "Dev"
  owner       = "Carmelo Buelvas"
  IAC         = "Terraform"
  IAC_version = "1.11.2"
}
key_name        = "DemoKeyPair"
sg_ingress_cidr = "0.0.0.0/0"
ec2_specs = {
  ami           = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
}