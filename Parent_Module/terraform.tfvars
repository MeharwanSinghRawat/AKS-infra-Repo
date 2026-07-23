resource_group = {
  rg1 = {
    rg_name  = "aks_rg"
    location = "east us"
  }
}






aks_clusters = {
  aks1 = {
    name              = "my-aks-cluster-dev"
    rg_name           = "aks_rg"
    location          = "east us"
    dns_prefix        = "myaksdnsdev"
    sku_tier          = "Free"
    node_pool_name    = "default"
    node_count        = 1
    vm_size           = "Standard_FX2mds_v2"
    os_disk_size_gb   = 30
    network_plugin    = "azure"
    network_policy    = "calico"
    load_balancer_sku = "standard"
    environment       = "dev"
    project           = "aks-demo"
  }
}

# terraform.tfvars
# acr_registries = {

#   acr1 = {
#     name          = "meharacr321"
#     rg_name       = "aks_rg"
#     location      = "West Europe"
#     sku           = "Basic"
#     admin_enabled = true
#     environment   = "dev"
#     project       = "aks-demo"
#   }
# }






