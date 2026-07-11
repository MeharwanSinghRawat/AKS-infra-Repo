variable "resource_group" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}


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


# variable "acr_registries" {
#   type = map(object({
#     name          = string
#     rg_name       = string
#     location      = string
#     sku           = string
#     admin_enabled = bool
#     environment   = string
#     project       = string
#   }))
# }
