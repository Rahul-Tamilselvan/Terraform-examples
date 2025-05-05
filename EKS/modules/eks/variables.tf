variable "environment" {
  description = "Environment name"
  type        = string
}

variable "desired_capacity" {
  description = "Number of worker nodes"
  type        = number
}

variable "subnet_ids" {
  description = "Subnets for the EKS cluster"
  type        = list(string)
}
