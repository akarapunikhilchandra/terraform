module "this" {
  source = "../terrafom-module"
  cidr_block = var.cidr_block
  common_tags = var.common_tags
  vpc_tags = var.vpc_tags
  igw_tags = var.igw_tags
  public_subnet_cidr = var.public_subnet_cidr
  public_subnet_names = var.public_subnet_names
  private_subnet_cidr = var.private_subnet_cidr
  private_subnet_names = var.private_subnet_names
  database_subnet_cidr = var.database_subnet_cidr
  database_subnet_names = var.database_subnet_names
  public_route_table = var.public_route_table
  private_route_table = var.private_route_table
  database_route_table = var.database_route_table
  azs = var.azs  
}