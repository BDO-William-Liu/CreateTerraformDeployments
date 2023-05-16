module "create-azure-package" {
    source = "./ModulePackage"

    name = var.name
    location = var.location
    address_space = var.address_space
    sql_username = var.sql_username
    sql_password = var.sql_password
    vm_size = var.vm_size
    vm_username = var.vm_username
    vm_password = var.vm_password
    address_prefix = var.address_prefix
}