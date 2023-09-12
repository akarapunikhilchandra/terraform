data "aws_vpc" "default" {
    default = true
}

output "vpc_info" {
    value = data.aws_vpc.default  
}

resource "aws_security_group" "allow-http" {
    name = var.sg_name
    vpc_id = data.aws_vpc.default.id
        description = "allowing port 80"
        ingress {
            description = "allowing all inbound traffic"
            from_port = 80
            to_port = 80 
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
      
        egress {
            from_port = 0
            to_port = 0
            protocol = "-1" 
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
