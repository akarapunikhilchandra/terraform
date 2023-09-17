variable "cidr_block" {
  
}

variable "common_tags" {
    default = {}
    type = map
}

variable "vpc_tags" {
    default = {}
    type = map
}

variable "igw_tags" {
    default = {}
    type = map
}

variable "public_subnet_names" {

}

variable "public_subnet_cidr" {

}
variable "private_subnet_names" {

}

variable "private_subnet_cidr" {

}
variable "database_subnet_names" {

}

variable "database_subnet_cidr" {

}
variable "public_route_table" {
  
}

variable "private_route_table" {
  
}

variable "database_route_table" {
  
}

variable "azs" {
    
}