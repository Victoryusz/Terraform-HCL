terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "grp_rec_terraform-state"
    storage_account_name = "victorstate"
    container_name       = "container-remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

}
