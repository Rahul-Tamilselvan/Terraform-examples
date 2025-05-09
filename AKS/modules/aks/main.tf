# Create AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.environment}-aks-cluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.environment}-aks"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  # Enable RBAC
  role_based_access_control_enabled = true
}
