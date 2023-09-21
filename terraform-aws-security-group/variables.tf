variable "project_name" {
  
}

variable "sg_name" {
  
}

variable "sg_description" {
  default = ""
}

variable "vpc_id" {
  
}

variable "sg_ingress_rules" {
  default = []    # without ingress rules anybody can create security_group  infuture they can add ingress if they want
}

variable "common_tags" {
  default = {}
}

variable "sg_tags" {
  default = {}
}
