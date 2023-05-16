terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "myResourceGroup" {
    name = "${var.name}-rg"
    location = var.location
}

resource "azurerm_virtual_network" "myAzureNetwork" {
    name = "${var.name}-vn"
    resource_group_name = azurerm_resource_group.myResourceGroup.name
    address_space = var.address_space
    location = azurerm_resource_group.myResourceGroup.location
}

resource "azurerm_sql_server" "myAzureSQLServer" {
  name = "${var.name}-sql"
  resource_group_name = azurerm_resource_group.myResourceGroup.name
  location = azurerm_resource_group.myResourceGroup.location
  version = "12.0"  // changing this value will force a new resource to be created
  administrator_login = var.sql_username
  administrator_login_password =  var.sql_password
}

resource "azurerm_subnet" "mySubnet" {
  name                 = "${var.name}-subnet"
  resource_group_name  = azurerm_resource_group.myResourceGroup.name
  virtual_network_name = azurerm_virtual_network.myAzureNetwork.name
  address_prefixes     = var.address_prefix
}

resource "azurerm_network_interface" "myNetworkInterface" {
  name                = "${var.name}-interface"
  location            = azurerm_resource_group.myResourceGroup.location
  resource_group_name = azurerm_resource_group.myResourceGroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "myVM" {
  name                  = "${var.name}-vm"
  location              = azurerm_resource_group.myResourceGroup.location
  resource_group_name   = azurerm_resource_group.myResourceGroup.name
  network_interface_ids = [azurerm_network_interface.myNetworkInterface.id]
  vm_size               = var.size

  storage_os_disk {
    name              = "myOSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = var.name
    admin_username = var.vm_username
    admin_password = var.vm_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}