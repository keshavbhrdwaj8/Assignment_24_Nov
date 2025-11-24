terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.103.0"
    }
  }
}
 
provider "azurerm" {
  subscription_id = "679f3d56-bed2-429f-9e31-4d7bf67e14c7"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}