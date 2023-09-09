variable "ami_id" {
    type = string
    default = "ami-03265a0778a880afb"
}

variable "sg_cidr" {
    type = list 
    default = ["0.0.0.0/0"]
}

variable "sg_name" {
    type = string
    default = "allow-all"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}