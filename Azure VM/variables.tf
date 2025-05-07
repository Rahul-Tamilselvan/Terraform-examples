variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "key_vault_secret_name" {
  description = "Name of the secret in the Key Vault that stores the VM password"
  type        = string
}
