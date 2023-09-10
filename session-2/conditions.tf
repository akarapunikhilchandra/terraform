resource "aws_instance" "myowninstance" {
    ami = var.ami_id
    instance_type = var.instance_name == "mongoDB" ? "t3.micro" : "t2.micro"
}