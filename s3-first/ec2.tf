resource "aws_instance" "myowninstance" {
    ami = "ami-03265a0778a880afb"
    instance_type = var.instance_type
    security_groups = [aws_security_group.allow_all.name]
    tags = var.tags
}