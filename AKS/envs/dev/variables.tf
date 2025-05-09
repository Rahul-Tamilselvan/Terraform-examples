variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the environment"
  type        = string
}

variable "environment" {
  description = "The name of the environment (dev, stage, prod)"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
}
