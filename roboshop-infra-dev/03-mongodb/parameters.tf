# resource "aws_ssm_parameter" "vpn_sg_id" {
#   name  = "/${var.project_name}/${var.env}/vpn_sg_id" 
#   type  = "String"
#   value = module.vpn_sg.security_group_id 
# }

resource "aws_ssm_parameter" "mongodb_url" {
  name = "/${var.project_name}/${var.env}/mongodb_url"
  type = "String"
  # for DEV it is mongodb-dev.joindevops.cloud 
  # for PROD it is mongodb-prod.joindevops.cloud 
  value = "${var.mongodb_record_name}-${var.env}.${var.zone_name}"
}