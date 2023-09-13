module "ec2" {
  source = "../terraform-module"
  ami_id = var.ami_id
  instance_type = var.instance_type
}