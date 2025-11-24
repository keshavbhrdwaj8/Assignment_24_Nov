
output "rg_name" {
  value       = data.azurerm_resource_group.rg.name
  description = "Existing RG name"
}

output "storage_account_name" {
  value       = azurerm_storage_account.this.name
  description = "Storage account name"
}

output "storage_account_id" {
  value       = azurerm_storage_account.this.id
  description = "Storage account ID"
}
