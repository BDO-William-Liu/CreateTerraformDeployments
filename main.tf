module "create-azure-package" {
    source = "./ModulePackage"

    rg_name = var.rg_name
    location = var.location
    vn_name = var.vn_name
    address_space = var.address_space
    sql_name = var.sql_name
    sql_username = var.sql_username
    sql_password = var.sql_password
    vm_name = var.vm_name
    size = var.size
    vm_username = var.vm_username
    vm_password = var.vm_password
    address_prefix = var.address_prefix
}