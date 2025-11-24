
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "rg_name" {
  type        = string
  description = "Existing Resource Group name"
  default     = "Keshav_Bhardwaj_RG"
}

variable "location" {
  type        = string
  description = "Azure region (should match RG location)"
  default     = "eastus"
}

variable "sa_name" {
  type        = string
  description = "Base storage account name (lowercase, 3-24 chars)"
  default     = "keshav24novsa"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}

# Ensure globally unique name with a short random suffix
resource "random_id" "suffix" {
  byte_length = 2
}

# Reference the existing corporate RG
data "azurerm_resource_group" "rg" {
  name = var.rg_name
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

output "storage_account_name" {
  value       = azurerm_storage_account.this.name
  description = "Storage account name"
}

output "storage_account_id" {
  value       = azurerm_storage_account.this.id
  description = "Storage account ID"
}
