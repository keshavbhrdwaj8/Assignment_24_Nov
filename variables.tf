
variable "rg_name" {
  type        = string
  description = "Existing corporate Resource Group name"
  default     = "Keshav_Bhardwaj_RG"
}

variable "sa_name" {
  type        = string
  description = "Base storage account name (lowercase, 3-24 chars)"
  default     = "neha24novsa"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to resources"
  default     = {}
}
