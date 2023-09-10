resource "aws_instance" "myowninstance" {
    count = 10
    ami = var.ami_id
    instance_type = var.instance_names[count.index] == "mongoDB" || var.instance_names[count.index] == "mysql" ? "t3.medium" : "t2.micro"
    tags = {
        Name=var.instance_names[count.index]
    }
}