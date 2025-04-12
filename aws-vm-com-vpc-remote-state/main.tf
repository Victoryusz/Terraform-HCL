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
    key    = "aws-vm/terraform.tfstate"
    region = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-1"

  default_tags {
    tags = {
      owner      = "Victor"
      managed-by = "terraform"
    }
  }
}

### Bloco de Data Source Configuration ###

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "victor-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-west-1"
  }
}
# Acessa o estado remoto da VPC no S3 para reutilizar seus dados. #
# Um bloco Data é usado para buscar dados existentes fora do seu código atual. #
