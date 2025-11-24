
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# You can hardcode the corporate RG name or pass it as a variable.
variable "rg_name" {
  type        = string
  description = "Existing Resource Group name"
  default     = "Keshav_Bhardwaj_RG"
}

data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

output "rg_name" {
  value       = data.azurerm_resource_group.rg.name
  description = "Existing RG name"
}

output "rg_id" {
  value       = data.azurerm_resource_group.rg.id
  description = "Existing RG ID"
}

output "rg_location" {
  value       = data.azurerm_resource_group.rg.location
  description = "Existing RG location"
}
