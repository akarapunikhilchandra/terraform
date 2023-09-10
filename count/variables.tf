#variable "instance_name" {
#    default = "cart"
#}

variable "ami_id" {
    type = string
    default = "ami-03265a0778a880afb"
}

variable "instance_names" {
    type = list
    default = ["mongoDB", "cart", "catalogue", "user", "redis", "mysql", "rabbitmq", "shipping", "payment", "web"]
}

variable "zone_id" {
    default = "Z10334032ZMZZ509Q21DU"
}

variable "domain" {
    default = "joindevops.cloud"
}