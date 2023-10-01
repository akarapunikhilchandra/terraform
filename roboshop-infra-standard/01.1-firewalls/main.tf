module "vpn_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name 
  sg_name = "roboshop-vpn"
  sg_description = "allowing all ports from my home IP"
# sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_vpc.default.id  #we are capturing the local ID in locals.tf so we are using it
  common_tags = merge(
    var.common_tags,
    {
        component = "vpn",
        Name = "roboshop-vpn"
    }
  )
}

module "mongodb_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name 
  sg_name = "mongodb"
  sg_description = "allowing traffic"
# sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
        component = "mongodb",
        Name = "mongodb"
    }
  )
}

module "catalogue_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name 
  sg_name = "catalogue"
  sg_description = "allowing traffic"
# sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
        component = "catalogue",
        Name = "catalogue"
    }
  )
}

module "web_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name 
  sg_name = "web"
  sg_description = "allowing traffic"
# sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
        component = "web",
        Name = "web"
    }
  )
}

module "app_alb_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name 
  sg_name = "app_alb"
  sg_description = "allowing traffic"
# sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
        component = "app",
        Name = "app-alb"
    }
  )
}
module "web_alb_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name 
  sg_name = "web_alb"
  sg_description = "allowing traffic"
# sg_ingress_rules = var.sg_ingress_rules
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = merge(
    var.common_tags,
    {
        component = "web",
        Name = "web-alb"
    }
  )
}

resource "aws_security_group_rule" "mongodb_catalogue" {
  type              = "ingress"
  description = "allowing port no 27017 from catalogue"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = module.catalogue_sg.security_group_id 
#   cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.mongodb_sg.security_group_id  
}
resource "aws_security_group_rule" "mongodb_vpn" {
  type              = "ingress"
  description = "allowing port number 22 from vpn"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id 
#   cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.mongodb_sg.security_group_id  
}
resource "aws_security_group_rule" "catalogue_vpn" {
  type              = "ingress"
  description = "allowing port number 22 from vpn"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id 
#   cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.catalogue_sg.security_group_id  
}
# resource "aws_security_group_rule" "catalogue_app_alb" {
#   type              = "ingress"
#   description = "allowing port number 8080 from app"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   source_security_group_id = module.app_alb_sg.security_group_id 
# #   cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
# #   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   security_group_id = module.catalogue_sg.security_group_id  
# }
# resource "aws_security_group_rule" "app_alb_vpn" {
#   type              = "ingress"
#   description = "allowing port number 80 from app"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   source_security_group_id = module.vpn_sg.security_group_id 
# #   cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
# #   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   security_group_id = module.app_alb_sg.security_group_id  
# }

# resource "aws_security_group_rule" "app_alb_web" {
#   type              = "ingress"
#   description = "allowing port number 80 from web"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   source_security_group_id = module.web_alb_sg.security_group_id 
# #   cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
# #   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   security_group_id = module.app_alb_sg.security_group_id  
# }

resource "aws_security_group_rule" "web_vpn" {
  type              = "ingress"
  description = "allowing port number 80 from vpn"
  from_port         = 80
  to_port           = 80   
  protocol          = "tcp"
  source_security_group_id = module.vpn_sg.security_group_id 
#   cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
#   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id = module.app_alb_sg.security_group_id  
}
# resource "aws_security_group_rule" "web_web_alb" {
#   type              = "ingress"
#   description = "allowing port number 80 from vpn"
#   from_port         = 80
#   to_port           = 80   
#   protocol          = "tcp"
#   source_security_group_id = module.web_alb_sg.security_group_id 
# #   cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
# #   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   security_group_id = module.web_sg.security_group_id  
# }

# resource "aws_security_group_rule" "web_alb_internet" {
#   type              = "ingress"
#   description = "allowing port number 80 from vpn"
#   from_port         = 80
#   to_port           = 80   
#   protocol          = "tcp"
#   cidr_blocks = ["0.0.0.0/0"] 
# #   cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
# #   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   security_group_id = module.web_alb_sg.security_group_id  
# }