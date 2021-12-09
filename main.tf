data "azurerm_resource_group" "main" {
   name = "${var.prefix}-resources"
}

data "azurerm_network_interface" "main" {
   name                = "${var.prefix}-nic1"
   resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_linux_virtual_machine" "default" {
   name                  = "my-first-instance"
   location              = data.azurerm_resource_group.main.location
   resource_group_name   = data.azurerm_resource_group.main.name
   network_interface_ids = [data.azurerm_network_interface.main.id]
   size                  = "Standard_B1s"

   os_disk {
      caching              = "None"
      storage_account_type = "Standard_LRS"
   }

   source_image_reference {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
   }

   admin_username                  = "azureuser"
   admin_password                  = "Arct!q!!"
   disable_password_authentication = false
   }
