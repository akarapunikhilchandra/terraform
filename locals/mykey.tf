resource "aws_instance" "mykey" {
  ami = local.ami_id
  instance_type = "t2.micro"
  key_name = aws_key_pair.deployer.key_name
}