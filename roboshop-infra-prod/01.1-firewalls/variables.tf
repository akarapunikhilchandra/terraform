variable "project_name" {
  default = "roboshop"
}
variable "common_tags" {
  default = {
    Project = "roboshop"
    #component = "firewalls-dev"
    Environment = "PROD"
    Terraform = "true"
  }
}

variable "env" {
  default = "prod"
}
