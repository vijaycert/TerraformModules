module "ResourceGroup" {
  source = "./modules/ResourceGroup"

  base_name = var.base_name
  location  = var.location
}

module "StorageAccount" {
  source = "./modules/StorageAccount"

  base_name           = var.base_name
  resource_group_name = module.ResourceGroup.rg_name_out
  location            = var.location

}

module "vnet" {
  source = "./modules/VirtualNetwork"

  resource_group_name = module.ResourceGroup.rg_name_out
  vnet_location       = var.location

  vVnet_name          = var.vVnet_name
  vVnet_address_space = var.vVnet_address_space
  vSubnet_Lin_name    = var.vSubnet_name
  vSubnet_Lin_space   = var.subnet_prefix
}

module "vmachine" {
  source = "./modules/VirtualMachine"

  resource_group_name = module.ResourceGroup.rg_name_out
  vm_location         = var.location
  #vVnet_name          = module.vnet.vnet_name_out
  subnet_id           = module.vnet.subnet_id_out
  vLinux_VM_size      = "Standard_B1s"
  vLinux_VM_name      = var.vLinux_VM_name


}