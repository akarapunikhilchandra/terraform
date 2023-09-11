resource "aws_instance" "file-function" {
    ami = local.ami_id 
    instance_type = var.isPROD ? "t3.micro" : "t2.micro"
}