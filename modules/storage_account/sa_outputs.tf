output "sa_name" {
  value = azurerm_storage_account.kuma-sa.name
}

output "share_name" {
  value = azurerm_storage_share.kuma-data.name
}

output "access_key_value" {
  value = data.azurerm_storage_account.kuma-sa.primary_access_key
}