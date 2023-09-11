resource "aws_instance" "my" {
    count = 10
    ami = var.ami_id
    instance_type = var.instance_names[count.index] == "mongodb" ? "t3.micro" : "t2.micro"
    tags = {
        Name = var.instance_names[count.index]  
    }
}

resource "aws_route53_record" "myrecord" {
  count   = 10
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.joindevops.cloud"
  type    = "A"
  ttl     = 1
  records = [aws_instance.my[count.index].private_ip]
}

