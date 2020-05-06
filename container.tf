resource "azurerm_storage_container" "tflab1-cont" {
 name = "statefile"
 storage_account_name = azurerm_storage_account.tflab1.name
 container_access_type = "private"
}
