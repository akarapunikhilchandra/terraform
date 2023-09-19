variable "cidr_block" {
  
}
variable "enable_dns_support" { #optional we gave default value
  default = "true"
}
variable "enable_dns_hostnames" { #optional we gave default value
  default = "true"
}
variable "project_name" {
  
}

variable "common_tags" { #even it is optional it is good to give tags
  default = {}
}
variable "vpc_tags" {
  default = {}
}
variable "igw_tags" {
  default = {}
}
variable "public_subnet_cidr" {
  type = list
  validation {
    condition     = length(var.public_subnet_cidr) == 2
    error_message = "Please Provide 2 public subnet cidr"
  }
}
variable "private_subnet_cidr" {
  type = list
  validation {
    condition     = length(var.private_subnet_cidr) == 2
    error_message = "Please Provide 2 private subnet cidr"
  }
}
variable "database_subnet_cidr" {
  type = list
  validation {
    condition     = length(var.database_subnet_cidr) == 2
    error_message = "Please Provide 2 database subnet cidr"
  }
}
variable "nat_gateway_tags" {
  default = {}
}
variable "public_route_table_tags" {
  default = {}
}
variable "private_route_table_tags" {
  default = {}
}
variable "database_route_table_tags" {
  default = {}
}
variable "db_subnet_group_tags" {
  default = {}
}