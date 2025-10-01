provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "we_rg" {
  name     = "rg-dev-westeurope"
  location = "West Europe"

  tags = {
    project = "multicloud-foundation"
    owner   = "lakunzy"
    env     = "dev"
  }
}

resource "random_id" "we_suffix" {
  byte_length = 4
}

resource "azurerm_storage_account" "we_storage" {
  name                     = "weudev${random_id.we_suffix.hex}"
  resource_group_name      = azurerm_resource_group.we_rg.name
  location                 = azurerm_resource_group.we_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    project = "multicloud-foundation"
    owner   = "lakunzy"
    env     = "dev"
    region  = "westeurope"
  }
}
