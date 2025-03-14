variable "virginia_cidr_block" {
  description = "CIDR block for the VPC in Virginia"
  type        = string
  sensitive   = false
}

variable "virginia_tags" {
  type = object({
    Name = string
    name = string
    env  = string
  })
  description = "Values for the tags for the VPC in Virginia"
}

variable "ohio_cidr_block" {
  description = "CIDR block for the VPC in Ohio"
  type        = string
  sensitive   = false
}

variable "ohio_tags" {
  type = object({
    Name = string
    name = string
    env  = string
  })
  description = "Values for the tags for the VPC in Ohio"
}
