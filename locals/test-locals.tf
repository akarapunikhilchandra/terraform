resource "aws_instance" "file-function" {
    ami = local.ami_id 
    instance_type = local.instance_type
}

resource "aws_key_pair" "deployer" {
  key_name   = local.key_name
  public_key = local.public_key
}