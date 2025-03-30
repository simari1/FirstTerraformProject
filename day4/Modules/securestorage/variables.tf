variable "environment" {
  description = "The environment to deploy to (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "The name of the resource group to create"
  type        = string
  default     = "myResourceGroup"
}

variable "location" {
  description = "The Azure region to deploy the resources in"
  type        = string
  default     = "East US"
}

variable "name" {
  description = "The name of the storage account"
  type        = string
  default     = "securestorage"
}
