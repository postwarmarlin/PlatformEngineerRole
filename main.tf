# Provider and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=> 4.30.0"
    }
  }
}

# Resource Group
resource "azurerm_resource_group" "uks-dv-congroup-01-rg" {
  name     = var.resource_group_name
  location = var.location
}

# App Service Plan (Linux for container support)
resource "azurerm_app_service_plan" "uksdvasp01" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.uks-dv-congroup-01-rg.location
  resource_group_name = azurerm_resource_group.uks-dv-congroup-01-rg.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Linux Web App (Docker container)
resource "azurerm_linux_web_app" "uksdvwebapp01" {
  name                = var.web_app_name
  location            = azurerm_resource_group.uks-dv-congroup-01-rg.location
  resource_group_name = azurerm_resource_group.uks-dv-congroup-01-rg.name
  service_plan_id     = azurerm_app_service_plan.uksdvasp01.id

  site_config {
    application_stack {
      docker_image_name = var.docker_image_name
    }
  }

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    DOCKER_ENABLE_CI                    = "true"
  }
}

