# variables.tf

variable "aks_clusters" {
  type = map(object({
    name                = string
    rg_name = string
    location            = string
    dns_prefix          = string
    sku_tier            = string
    node_pool_name      = string
    node_count          = number
    vm_size             = string
    os_disk_size_gb     = number
    network_plugin      = string
    network_policy      = string
    load_balancer_sku   = string
    environment         = string
    project             = string
  }))
}

output "kubelet_identity_object_id" {
  value = {
    for k, v in azurerm_kubernetes_cluster.aks :
    k => v.kubelet_identity[0].object_id
  }
}