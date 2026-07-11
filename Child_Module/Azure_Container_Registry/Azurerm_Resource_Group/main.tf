resource "azurerm_container_registry" "acr" {
  for_each = var.acr_registries
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled
  tags = {
    environment = each.value.environment
    project     = each.value.project
  }
}