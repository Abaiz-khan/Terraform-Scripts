terraform {
  backend "azurerm" {
    resource_group_name = "production_rg"
    storage_account_name = "qatestingterraform"
    key = "terraform.tfstate"
  }
}