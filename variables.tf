variable "name" {
    description = "name of the azure package"
    type = string
    default = "myterraformPackage"
}

variable "location" {
    description = "location of resource group"
    type = string
    default = "east us"
}

variable "address_space" {
    description = "network address of virtual network server"
    type = list(string)
    default = ["10.0.0.0/16"]
}

variable "sql_username" {
    description = "administrative username to sql server"
    type = string
    default = "azureuser"
    sensitive = true
}

variable "sql_password" {
    description = "adminstrative password to sql server"
    type = string
    default = "P@$$w0rd1234!"
    sensitive = true
}

variable "size" {
    description = "the desired size for the virtual machine"
    type = string
    default = "Standard_DS1_v2"
}

variable "vm_username" {
    description = "username to connect to the virtual machine"
    type = string
    default = "azureuser"
    sensitive = true
}

variable "vm_password" {
    description = "password to connect to the virtual machine"
    type = string
    default = "P@$$w0rd1234!"
    sensitive = true
}

variable "address_prefix" {
    description = "address prefix of the azure subnet"
    type = list(string)
    default = ["10.0.2.0/24"]
}