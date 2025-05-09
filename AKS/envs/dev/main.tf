terraform {
  required_version = ">= 1.3.0"
}

# Use networking module
module "networking" {
  source              = "../../modules/networking"
  location            = var.location
  resource_group_name = var.resource_group_name
  environment         = var.environment
}

# Use AKS module
module "aks" {
  source              = "../../modules/aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  environment         = var.environment
  node_count          = var.node_count
}
