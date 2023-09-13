module "ec2" {
  source = "../terraform-module"
  ami = var.ami_id
  instance_type = var.instance_type
}