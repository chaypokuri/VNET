provider "azurerm" {
  features {}
subscription_id = "3b0001e1-fb16-4989-82d1-25f2576e17d3"
tenant_id = "ea520df7-ee9a-4873-8bca-310c5441db15"
client_id = "2db4b062-2758-45b9-b41c-1260a55aa6aa"
client_secret = "jdf8Q~_pD_q8~zx4dta4-rQBO1I_BUbC.v4Lacrd"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}resource "azurerm_resource_group" "example" {
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
