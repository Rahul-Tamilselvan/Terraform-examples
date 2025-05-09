terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateaksstorage"
    container_name       = "tfstate"
    key                  = "terraform-aks-${terraform.workspace}.tfstate"
  }
}
