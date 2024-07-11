# Create a resource group
resource "azurerm_resource_group" "prod-web-rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create app service plan
resource "azurerm_app_service_plan" "service-plan" {
  name                = "service_plan"
  location            = azurerm_resource_group.prod-web-rg.location
  resource_group_name = azurerm_resource_group.prod-web-rg.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }
  tags = {
    environment = "dev"
  }
}

# Create JAVA app service
resource "azurerm_app_service" "app-service" {
  name                = "prod-springbootapp"
  location            = azurerm_resource_group.prod-web-rg.location
  resource_group_name = azurerm_resource_group.prod-web-rg.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id
  site_config {
    linux_fx_version = "TOMCAT|8.5-jre8"
  }
  app_settings = {
    "SCM_DO_BUILD_DURING_DEPLOYMENT"      = "true"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL"          = var.DOCKER_REGISTRY_SERVER_URL
    "DOCKER_REGISTRY_SERVER_USERNAME"     = var.DOCKER_REGISTRY_SERVER_USERNAME
    "DOCKER_REGISTRY_SERVER_PASSWORD"     = var.DOCKER_REGISTRY_SERVER_PASSWORD
  }
  tags = {
    environment = "prod"
  }
}
