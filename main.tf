module "create-azure-package" {
    source = "./ModulePackage"

    resource_group_name = var.resource_group_name
    virtual_network_name = var.virtual_network_name
    virtual_machine_name = var.virtual_machine_name
    sql_server_name = var.sql_server_name
    location = var.location
    address_space = var.address_space
    sql_username = var.sql_username
    sql_password = var.sql_password
    vm_size = var.vm_size
    vm_username = var.vm_username
    vm_password = var.vm_password
    address_prefix = var.address_prefix
}