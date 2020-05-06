provider "azurerm" {
 features {}
}
resource "azurerm_resource_group" "tflab1" {
 name = "rg-tflab1"
 location = "westeurope"
}
resource "random_string" "storageaccountname" {
 length = 16
 upper = false
 special = false
}
resource "azurerm_storage_account" "tflab1" {
 name = random_string.storageaccountname.result
 resource_group_name = azurerm_resource_group.tflab1.name
 location = azurerm_resource_group.tflab1.location
 account_tier = "Standard"
 account_replication_type = "LRS"
 tags = {
 control = "terraform"
 }
}
output "storageaccountname" {
 value = azurerm_storage_account.tflab1.name
}
output "storageaccountkey" {
 value = azurerm_storage_account.tflab1.primary_access_key
} 
