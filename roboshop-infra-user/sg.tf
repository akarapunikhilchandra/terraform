module "allow_all_sg" {
  source = "../terraform-aws-security-group"
  project_name = var.project_name 
  sg_name = "allow-all"
  sg_description = "allowing all ports from internet"
  sg_ingress_rules = var.sg_ingress_rules
  vpc_id = local.vpc_id  #we are capturing the local ID in locals.tf so we are using it
  common_tags = var.common_tags 
  }