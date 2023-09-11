locals {
    ami_id = "ami-0f409bae3775dc8e5"
    instance_type = var.isPROD ? "t3.micro" : "t2.micro"
    public_key = file("${path.module}/ansible.pub")
    key_name   = "ansible.pub"
}