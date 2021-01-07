provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "tf_test" {
  name = "tTFmainrg"
  location = "UK South"
}

resource "azurerm_container_group" "tfcg_test" {
  name                      = "weatherapi"
  location                  = azurerm_resource_group.tf_test.location
  resource_group_name       = azurerm_resource_group.tf_test.name

  ip_address_type     = "public"
  dns_name_label      = "csmarpuriwa"
  os_type             = "Linux"

  container {
      name            = "weatherapi"
      image           = "csmarpuri/weatherapi"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 80
            protocol    = "TCP"
        }
  }
}