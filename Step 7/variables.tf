variable "virginia_cidr_block" {
  description = "CIDR block for the VPC in Virginia"
  type        = string
  sensitive   = false
}

variable "public_subnet" {
  description = "CIDR public subnet"
  type        = string
}

variable "private_subnet" {
  description = "CIDR private subnet"
  type        = string
}

variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the Project"
  type        = map(string)
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "sg_ingress_cidr" {
  description = "CIDR blocks for the security group ingress rules"
  type        = string
}

variable "ec2_specs" {
  description = "EC2 instance specifications"
  type        = map(string)
}

variable "instances" {
  description = "List of instances"
  type        = set(string)
  default     = ["apache"]
}

variable "enable_monitoring" {
  description = "Enable monitoring instance"
  type        = bool
  default     = false
}

variable "ingress_ports_list" {
  description = "List of ingress ports"
  type        = list(number)
  default     = [22, 80]
}