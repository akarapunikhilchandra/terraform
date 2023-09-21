variable "cidr_block" {
  
}

variable "enable_dns_hostnames" {
  default = true
}

variable "enable_dns_support" {
  default = true 
}

variable "common_tags" {
  default = {}
  type = map 
}

variable "vpc_tags" {
  default = {}
  type = map
}

variable "public_subnet_cidr" {
  
}

variable "azs" {
  
}

variable "public_subnet_names" {
  
}

variable "private_subnet_cidr" {
  
}

# variable "azs" {
  
# }

variable "private_subnet_names" {
  
}

variable "igw_tags" {
  default = {}
  type = map
}

variable "database_subnet_cidr" {
  
}

variable "database_subnet_names" {
  
}