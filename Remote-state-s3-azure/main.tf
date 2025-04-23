###### BLOCO DO TERRAFORM COM REQUIRED VERSION E COM DOIS REQUIRED PROVIDERS ######

terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }
}

###### BLOCO DE PROVIDER DA AWS ######

provider "aws" {
  region = "us-west-1"
  default_tags {
    tags = {
      owner      = "Victor"
      managed-by = "Terraform"
    }
  }
}

###### BLOCO DE PROVIDER DA AZURE ######

provider "azurerm" {
  features {}
}
