terraform {
  required_version = ">= 1.10.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.38"
    }
  }

  backend "azurerm" {
    resource_group_name  = "sohit-rg"
    storage_account_name = "sohittfstate001"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }


provider "azurerm" {
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "test" {
  name     = "sohit-oidc-test-rg"
  location = "Central India"
}
