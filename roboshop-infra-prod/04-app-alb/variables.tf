variable "project_name" {
  default = "roboshop"
}
variable "common_tags" {
  default = {
    Project = "roboshop"
    component = "app-alb"
    Environment = "PROD"
    Terraform = "true"
  }
}

variable "env" {
  default = "prod"
}