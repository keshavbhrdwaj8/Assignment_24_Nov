terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.103.0"
    }
  }
}

// provider.tf (root)
provider "azurerm" {
  features {}

  // Optional: if you want to hardcode (better to use env/vars)
  // subscription_id = var.subscription_id
}

// If you choose to pass it via variable:
// variables.tf (root)
variable "subscription_id" {
  type        = string
  description = "679f3d56-bed2-429f-9e31-4d7bf67e14c7"
}
