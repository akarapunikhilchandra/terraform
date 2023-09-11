variable "ami_id" {
    type = string
    default = "ami-0f409bae3775dc8e5"
}

variable "instance_names" {
    type = list 
    default = ["mongodb", "cart", "catalogue", "user", "redis", "mysql", "rabbitmq", "shipping", "payment", "web"]
}

variable "zone_id" {
    type = string
    default = "Z10334032ZMZZ509Q21DU"
}