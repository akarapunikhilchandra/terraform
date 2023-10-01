# movies to 01.1 firewalls 
# module "mongodb_sg" {
#   source = "../../terraform-aws-security-group"
#   project_name = var.project_name 
#   sg_name = "mongodb"
#   sg_description = "Allowing Traffic"
# #   sg_ingress_rules = var.sg_ingress_rules
#   # we are using the ssm parameters stored in the name of vpc_id
#   vpc_id = data.aws_ssm_parameter.vpc_id.value 
#   common_tags = var.common_tags
# }
#moved to firewall
# resource "aws_security_group_rule" "mongodb_vpn" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   source_security_group_id = data.aws_ssm_parameter.vpn_sg_id.value 
# #   cidr_blocks       = ["${chomp(data.http.myip.body)}/32"]
# #   ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   security_group_id = module.mongodb_sg.security_group_id  
# }

module "mongodb_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops.id
  instance_type = "t3.medium"
  vpc_security_group_ids = [module.mongodb_sg.security_group_id] 
  # this should be in roboshop db subnet
  subnet_id = local.db_subnet_id 
  user_data = file("mongodb.sh")
  tags = merge(
    {
        Name = "mongodb "
    },
    var.common_tags
  )
}