variable "instances" {
    type = map 
    default = {
        mongodb = "t2.micro"
        mysql = "t2.micro"
        # redis = "t2.micro"
        # rabbitmq = "t2.micro"
        # catalogue = "t2.micro"
        # user = "t2.micro"
        # cart = "t2.micro"
        # shipping = "t2.micro"
        # payment = "t2.micro"
        # web = "t2.micro"
    }
}

variable "zone_id" {
    default = "Z10334032ZMZZ509Q21DU"
}

variable "domain" {
    default = "joindevops.cloud"
}

variable "sg_name" {
    type = string
}

variable "sg_cidr" {
    default = ["0.0.0.0/0"]
}

variable "ami_id" {
    default = "ami-03265a0778a880afb"
}