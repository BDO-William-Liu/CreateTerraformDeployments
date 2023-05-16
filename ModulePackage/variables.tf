variable "rg_name" {
    description = "name of the resource group"
    type = string
    default = ""
}

variable "location" {
    description = "location of resource group"
    type = string
    default = ""
}

variable "vn_name" {
    description = "name of virtual network"
    type = string
    default = ""
}

variable "address_space" {
    description = "network address of virtual network server"
    type = list(string)
    default = []
}

variable "sql_name" {
    description = "name of the sql server"
    type = string
    default = ""
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

variable "vm_name" {
    description = "the name of the virtual machine that is to be created"
    type = string
    default = ""
}

variable "size" {
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