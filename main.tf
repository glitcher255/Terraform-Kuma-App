resource "azurerm_resource_group" "RG-kuma-app-1" {
  name = "RG-kuma_app-1"
  location = var.location
}

module "web_apps" {
  source = "./modules/web_apps"
  location = var.location
  rg_name = azurerm_resource_group.RG-kuma-app-1.name
  sa_name = module.storage_account.sa_name
  share_name = module.storage_account.share_name
  access_key_value = module.storage_account.access_key_value
  depends_on = [ module.storage_account ]
}

module "storage_account" {
  source = "./modules/storage_account"
  location = var.location
  rg_name = azurerm_resource_group.RG-kuma-app-1.name
  depends_on = [ azurerm_resource_group.RG-kuma-app-1 ]
}