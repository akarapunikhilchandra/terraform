variable "project_name" {
  default = "roboshop"
}
variable "common_tags" {
  default = {
    Project = "roboshop"
    component = "redis"
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