resource "aws_lb" "web_alb" {  
  name               = "${var.project_name}-${var.common_tags.component}"
  internal           = false 
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.web_alb_sg_id.value]
  subnets            = split(",",data.aws_ssm_parameter.public_subnet_ids.value) 

#enable_deletion_protection = true
  tags = var.common_tags 
}
resource "aws_acm_certificate" "example" {
  domain_name       = "joindevops.cloud"
  validation_method = "DNS"
  tags = var.common_tags
}

data "aws_route53_zone" "joindevops" {
  name         = "joindevops.cloud"
  private_zone = false
}

resource "aws_route53_record" "joindevops" {
  for_each = {
    for dvo in aws_acm_certificate.example.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.joindevops.zone_id
}

resource "aws_acm_certificate_validation" "joindevops" {
  certificate_arn         = aws_acm_certificate.example.arn
  validation_record_fqdns = [for record in aws_route53_record.joindevops : record.fqdn]
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.example.arn 

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "this is the fixed response from web-alb https"
      status_code  = "200"
    } 
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = "joindevops.cloud"

  records = [
    {
      name    = ""
      type    = "A"
      alias   = {
        name    = aws_lb.web_alb.dns_name 
        zone_id = aws_lb.web_alb.zone_id 
      }
    } 
  ]
}
# resource "aws_lb_listener" "https" {
#   load_balancer_arn = aws_lb.web_alb.arn 
#   port              = "443"
#   protocol          = "HTTPS"
# #this will add 1 listener in port no 80 and one default rule 
#   default_action {
#     type = "fixed-response"

#     fixed_response {
#       content_type = "text/plain"
#       message_body = "this is fixed response from APP ALB"
#       status_code  = "200"
#     }
#   }
# } 