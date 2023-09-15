variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "common_tags" { 
  default = {
    Name = "roboshop"
    Env = "dev"
    Terraform = "true"
  }
}

variable "public_subnet_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_names" {
  default = ["roboshop-public-1a", "roboshop-public-1b"]
}

variable "private_subnet_cidr" {
  default = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_names" {
  default = ["roboshop-private-1a", "roboshop-private-1b"]
}

variable "igw_tags" {
  default = {
    Name = "roboshop"
  }
}

variable "database_subnet_cidr" {
  default = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "database_subnet_names" {
  default = ["database-1a", "database-1b"]
}