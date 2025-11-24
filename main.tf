# Read existing corporate RG; do NOT create a new one
data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

# Short random suffix to ensure global uniqueness of storage account names
resource "random_id" "suffix" {
  byte_length = 2
}

resource "azurerm_storage_account" "this" {
  name                     = lower(substr(join("", [var.sa_name, random_id.suffix.hex]), 0, 24))
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  tags                     = var.tags
}


module "resource1" {
  source = "./modules/resource1"
  rg_name = "Keshav_Bhardwaj_RG"
}

module "resource2" {
  source = "./modules/resource2"
  rg_name = "Keshav_Bhardwaj_RG"
  location = "eastus"
  sa_name = "keshav24novsa"
}

