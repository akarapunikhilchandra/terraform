variable "project_name" {
  default = "roboshop"
}
variable "common_tags" {
  default = {
    Project = "roboshop"
    component = "mongodb"
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "env" {
  default = "dev"
}
variable "zone_name" {
  default = "joindevops.cloud"
}

variable "mongodb_record_name"{
  default = "mongodb"
}