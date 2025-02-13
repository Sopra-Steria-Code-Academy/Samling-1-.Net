
# Create an Azure App Service Plan
resource "azurerm_service_plan" "main" {
  name                = "${var.app_service_plan}-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  os_type             = "Linux"
  sku_name            = "B2"
  worker_count        = 1
}

# Create an Azure App Service
resource "azurerm_linux_web_app" "main" {
  name                      = "${var.app_service}-${var.environment}"
  resource_group_name       = azurerm_resource_group.main.name
  location                  = azurerm_service_plan.main.location
  service_plan_id           = azurerm_service_plan.main.id
  https_only                = true

  site_config {
    http2_enabled    = true
    /*app_command_line = "dotnet ./REIN-Hub-Api.dll"

    cors {
      allowed_origins     = ["https://customerportal-frontend-test.azurewebsites.net"]
      support_credentials = true
    }*/
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    ASPNETCORE_ENVIRONMENT                          = "Test"
  }
}
