variable "project_name" {
  default = "roboshop"
}
variable "common_tags" {
  default = {
    Project = "roboshop"
    component = "App-ALB"
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "env" {
  default = "dev"
}