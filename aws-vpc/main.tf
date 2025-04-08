terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }

  backend "s3" {
    bucket = "victor-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-1"

  default_tags {
    tags = {
      owner      = "Victor"
      managed-by = "Terraform"
    }
  }
}
