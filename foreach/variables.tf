variable "instances" {
    type = map 
    default = {
        mongodb = "t3.micro"
        mysql = "t3.micro"
        redis = "t2.micro"
        rabbitmq = "t2.micro"
        catalogue = "t2.micro"
        user = "t2.micro"
        cart = "t2.micro"
        shipping = "t2.micro"
        payment = "t2.micro"
        web = "t2.micro"
    }
}

variable "ami_id" {
    type = string
    default = "ami-0f409bae3775dc8e5"
}

variable "zone_id" {
    type = string
    default = "Z10334032ZMZZ509Q21DU"
}

variable "domain" {
    type = string
    default = "joindevops.cloud"  
}

variable "ingress" {
    type = list 
    default = [
        {
            from_port = 80
            to_port = 80
            description = "allowing PORT 80 from public"
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 443
            to_port = 443
            description = "allowing PORT 443 from public"
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 22
            to_port = 22
            description = "allowing PORT 22 from public"
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}