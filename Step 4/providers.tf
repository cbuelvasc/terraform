terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.66.0, <5.91.0, !=5.63.1"
    }
  }
  required_version = "~>1.11"
}

provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}

provider "aws" {
  region = "us-east-2"
  alias  = "ohio"
}