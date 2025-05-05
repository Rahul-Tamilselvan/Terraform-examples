terraform {
  required_version = ">= 1.3.0"
}

# Reuse the EKS module for this environment
module "eks" {
  source           = "../../modules/eks"
  environment      = var.environment
  desired_capacity = var.desired_capacity
  subnet_ids       = var.subnet_ids
}
