provider "azurerm" {
  features {}
subscription id = "c2bd123a-183f-43d5-bf41-c725494e595a"
tenant id = "3180c264-31bc-4113-8f50-b7393a40457b"
client id = "1a046c02-8c39-4f1d-b30b-93f41a9c6b15"
client secret = "kUz8Q~qwom0J-MM5ZNqexXyUOguygMj5QELdhdl5"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}
