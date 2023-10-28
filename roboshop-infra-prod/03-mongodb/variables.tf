variable "project_name" {
  default = "roboshop"
}
variable "common_tags" {
  default = {
    Project = "roboshop"
    component = "mongodb"
    Environment = "PROD"
    Terraform = "true"
  }
}

variable "env" {
  default = "prod"
}
variable "zone_name" {
  default = "joindevops.cloud"
}

variable "mongodb_record_name"{
  default = "mongodb"
}