module "azurerm_resource_group" {
    source = "../Child_Module/Azurerm_Resource_Group"
  resource_group = var.resource_group
}

module "azurerm_kubernetes_cluster" {
    source = "../Child_Module/Azure_Kuberntes_Cluster"
    aks_clusters = var.aks_clusters
    depends_on = [module.azurerm_resource_group]
}

# module "azurerm_container_registry" {
#     source = "../Child_Module/Azure_Container_Registry/Azurerm_Resource_Group"
#   acr_registries = var.acr_registries
#   depends_on = [ module.azurerm_resource_group ]
# }


# resource "azurerm_role_assignment" "aks_acr_pull" {
#   principal_id = module.azurerm_kubernetes_cluster.kubelet_identity_object_id["aks1"]
#   role_definition_name = "AcrPull"
#   scope = module.azurerm_container_registry.acr_id["acr1"]
#   skip_service_principal_aad_check = true
# }
