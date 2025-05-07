resource "azurerm_service_plan" "main" {
  name = "kuma-plan"
  location = var.location
  resource_group_name = var.rg_name
  os_type = "Linux"
  sku_name = "B1"
}

resource "azurerm_linux_web_app" "main" {
  name = "kuma-app-1"
  location = var.location
  resource_group_name = var.rg_name
  service_plan_id = azurerm_service_plan.main.id

  site_config {
    application_stack {
      docker_image_name = "louislam/uptime-kuma:latest"
      docker_registry_url = "https://index.docker.io"
    }
    #scm_type = "LocalGit"
    app_command_line = ""
  }

#optional for presistant storage
    storage_account {
      name = "test"
      account_name = var.sa_name
      share_name = var.share_name
      access_key = var.access_key_value
      type = "AzureFiles"
      mount_path   = "/app/data"
    }
  app_settings = {
    WEBSITES_PORT = "3001"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "true"
    "UPTIME_KUMA_DATA_DIR" = "/app/data"
  }
  https_only = true
}