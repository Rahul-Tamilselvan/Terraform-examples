variable "aws_region" {
  description = "AWS region for resource provisioning"
  type        = string
}

variable "environment" {
  description = "Environment name: dev, stage, or prod"
  type        = string
}

variable "desired_capacity" {
  description = "Number of worker nodes in the cluster"
  type        = number
}

variable "subnet_ids" {
  description = "Subnets for EKS cluster networking"
  type        = list(string)
}
