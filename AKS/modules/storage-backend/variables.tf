variable "resource_group_name" {
  description = "Name of the resource group to hold the storage account"
  type        = string
}

variable "location" {
  description = "Azure region for the resource group and storage"
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique name for the Azure Storage Account"
  type        = string
}

variable "container_name" {
  description = "Name of the blob container to store the state file"
  type        = string
}
