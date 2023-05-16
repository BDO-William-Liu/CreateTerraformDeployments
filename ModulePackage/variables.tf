variable "name" {
    description = "name of the package"
    type = string
    default = ""
}

variable "location" {
    description = "location of resource group"
    type = string
    default = ""
}

variable "address_space" {
    description = "network address of virtual network server"
    type = list(string)
    default = []
}

variable "sql_username" {
    description = "administrative username to sql server"
    type = string
    default = ""
    sensitive = true
}

variable "sql_password" {
    description = "adminstrative password to sql server"
    type = string
    default = ""
    sensitive = true
}

variable "vm_size" {
    description = "the desired size for the virtual machine"
    type = string
    default = ""
}

variable "vm_username" {
    description = "username to connect to the virtual machine"
    type = string
    default = ""
    sensitive = true
}

variable "vm_password" {
    description = "password to connect to the virtual machine"
    type = string
    default = ""
    sensitive = true
}

variable "address_prefix" {
    description = "address prefix of the azure subnet"
    type = list(string)
    default = []
}