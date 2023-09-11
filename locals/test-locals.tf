resource "aws_instance" "file-function" {
    count = 3
    ami = local.ami_id 
    instance_type = var.instance_names[count.index]
    tags = {
        Name = var.instance_names[count.index]  
    }  
}

resource "aws_key_pair" "deployer" {
  key_name   = local.key_name
  public_key = local.public_key
}