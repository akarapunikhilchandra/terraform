variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "common_tags" {
    default = {
        Name = "roboshop"
        Environment = "DEV"
        Terraform = "true"
    }
}

variable "vpc_tags" {
  default = {
    Name = "main"
  }
}

variable "igw_tags" {
  default = {
    Name = "internet_gateway"
  }
}

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

# variable "public_subnet_tags" {
#   default = {
#     Name = "public_subnet"
#   }
# }

variable "public_subnet_names" {

  default = ["public-subnet-1a", "public-subnet-1b"]
}

variable "private_subnet_cidr" {
  default = ["10.0.11.0/24", "10.0.22.0/24"]
}

variable "private_subnet_names" {

  default = ["private-subnet-1a", "private-subnet-1b"]
}
variable "database_subnet_cidr" {
  default = ["10.0.33.0/24", "10.0.44.0/24"]
}

variable "database_subnet_names" {
  default = ["database-subnet-1a", "database-subnet-1b"]
}

variable "public_route_table" {
  default = {
    Name = "Public-route"
  }
}

variable "private_route_table" {
 default = {
  Name = "private-route"
 } 
}

variable "database_route_table" {
  default = {
    Name = "database-route"
  }
}

variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
}