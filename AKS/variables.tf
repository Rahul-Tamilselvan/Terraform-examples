variable "location" {
  description = "Azure region for the deployment"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, stage, prod)"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in AKS cluster"
  type        = number
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}
