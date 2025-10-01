provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "east_rg" {
  name     = "rg-dev-eastus"
  location = "East US"

  tags = {
    project = "multicloud-foundation"
    owner   = "lakunzy"
    env     = "dev"
  }
}

resource "random_id" "east_suffix" {
  byte_length = 4
}

resource "azurerm_storage_account" "east_storage" {
  name                     = "eastusdev${random_id.east_suffix.hex}"
  resource_group_name      = azurerm_resource_group.east_rg.name
  location                 = azurerm_resource_group.east_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    project = "multicloud-foundation"
    owner   = "lakunzy"
    env     = "dev"
    region  = "eastus"
  }
}
