variable "base_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vVnet_name" {
  type = string
}

variable "vVnet_address_space" {
  type = list(string)
}

variable "vSubnet_name" {
  type = string
}

variable "subnet_prefix" {
  type = list(string)
}

variable "vLinux_VM_name" {
  type = string
}