terraform {
  required_version = "=> 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.93.0"
    }
  }
}

# Configura o provedor AWS e define tags padrão para os recursos

provider "aws" {
  region = "us-west-1"

  default_tags {
    tags = {
      owner      = "victor"
      managed-by = "terraform"
    }
  }
}
