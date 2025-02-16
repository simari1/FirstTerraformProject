variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
}

variable "location" {
  description = "The location for the resource group and storage account."
}

variable "subscription_id" {
  description = "The subscription id in which to create the storage account."
}
variable "example_set" {
  type    = set(string)
  default = ["apple", "banana", "orange"]
}
