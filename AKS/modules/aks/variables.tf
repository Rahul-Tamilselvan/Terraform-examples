variable "location" {
  description = "Azure location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev/stage/prod)"
  type        = string
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
}
