
provider "azurerm" {
  features {}
  # subscription id is in the terraform.tfvars file, do not check in the subscription id
  subscription_id = var.subscription_id
}

provider "random" {
  # Configuration options
}
