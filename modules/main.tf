terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "RG"
      storage_account_name = "tfst01"
      container_name       = "contname"
      key                  = "RG"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "resource_group" {
  source     = "./resources/010_RG" 
  RgName     = var.RgName 
  RgLocation = var.RgLocation
}

# module "windows_virtual_machine" {
#   source = "./resources/0120_vm"
#   RgName         = var.RgName 
#   nsgname        = var.nsgname 
#   vnetName       = var.vnetName 
#   sub01          = var.sub01 
#   sub02          = var.sub02 
#   nicName        = var.nicName
#  vmName          = var.vmName 
# }

# module "pubip" {
#  source = "./resources/0121_publicip" 
#  RgName = var.RgName
#  pubip = var.pubip
# }

# module "key_vault" {
#   source = "./resources/0130_key_vault"
#   RgName        = var.RgName 
#   kvName        = var.kvName
# }