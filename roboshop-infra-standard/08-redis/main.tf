module "redis_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.redis_sg_id.value] 
  # this should be in roboshop db subnet
  subnet_id = local.db_subnet_id 
  user_data = file("redis.sh")
  tags = merge(
    {
        Name = "redis"
    },
    var.common_tags
  )
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = var.zone_name
  records = [
    {
        name    = "mongodb"
        type    = "A"
        ttl     = 1
        records = [
            module.redis_instance.private_ip
        ]
    }
  ]
}
