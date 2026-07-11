# main.tf

resource "azurerm_kubernetes_cluster" "aks" {

  for_each = var.aks_clusters

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dns_prefix          = each.value.dns_prefix
  sku_tier            = each.value.sku_tier

  default_node_pool {
    name            = each.value.node_pool_name
    node_count      = each.value.node_count
    vm_size         = each.value.vm_size
    os_disk_size_gb = each.value.os_disk_size_gb
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  network_profile {
    network_plugin    = each.value.network_plugin
    network_policy    = each.value.network_policy
    load_balancer_sku = each.value.load_balancer_sku
  }

  tags = {
    environment = each.value.environment
    project     = each.value.project
  }
}