variable "project_name" {
  default = "roboshop"
}
variable "common_tags" {
  default = {
    Project = "roboshop"
    component = "cart"
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "env" {
  default = "dev"
}
# health check already given by module developer 
# variable "health_check" {
#   default = {
#     enabled = true
#     healthy_threshold = 2 #consider as healthy if 2 health checks are success 
#     interval = 15 
#     matcher = "200-299"
#     path = "/"
#     port = 80
#     protocol = "HTTP"
#     timeout = 5
#     unhealthy_threshold = 3
#   }
# }

variable "target_group_port" {
  default = 8080
}

variable "launch_template_tags" {
  default = [
    {
    resource_type = "instance"

    tags = {
      Name = "cart"
    }
  },
  {
    resource_type = "volume"

    tags = {
      Name = "cart"
    }
  }
] 
}

variable "autoscaling_tags" {
  default = [
    {
      key = "name"
      value = "cart"
      propagate_at_launch = true 
    },
    {
      key = "project"
      value = "roboshop"
      propagate_at_launch = true 
    }
  ]
}  