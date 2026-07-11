
variable "acr_registries" {
  type = map(object({
    name          = string
    rg_name       = string
    location      = string
    sku           = string
    admin_enabled = bool
    environment   = string
    project       = string
  }))
}


output "acr_id" {
  value = {
    for k, v in azurerm_container_registry.acr :
    k => v.id
  }
}