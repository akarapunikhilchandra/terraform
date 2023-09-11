resource "aws_instance" "file-function" {
    ami = local.ami_id 
    instance_type = local.instance_type
}