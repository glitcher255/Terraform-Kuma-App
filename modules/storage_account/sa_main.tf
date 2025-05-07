#Storage account
resource "azurerm_storage_account" "kuma-sa" {
  name = "glitcher2550kuma0sa"
  location = var.location
  resource_group_name = var.rg_name
  account_tier = "Standard"
  account_replication_type = "LRS"
}

#needed in output "access_key_value", used in app_main.tf
data "azurerm_storage_account" "kuma-sa" {
  name                = azurerm_storage_account.kuma-sa.name
  resource_group_name = var.rg_name
}

#Storage account data
resource "azurerm_storage_share" "kuma-data" {
  name                 = "kuma-data"
  quota                = 1  # in GB
  storage_account_id = azurerm_storage_account.kuma-sa.id
}