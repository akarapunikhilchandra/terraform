module "this" {
  source = "../module-development"
  cidr_block = var.cidr_block
  common_tags = var.common_tags
  public_subnet_cidr = var.public_subnet_cidr
  azs = var.azs
  public_subnet_names = var.public_subnet_names
  private_subnet_cidr = var.private_subnet_cidr
  private_subnet_names = var.private_subnet_names  
  igw_tags = var.igw_tags 
  database_subnet_cidr = var.private_subnet_cidr
  database_subnet_names = var.private_subnet_names
}