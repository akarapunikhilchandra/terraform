resource "aws_security_group" "allow_all" {
    name = var.sg_name
    description = "allow-all"
    ingress {
        description = "allow-all"
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = var.sg_cidr
    }
    egress {
        description = "allow-all"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.sg_cidr
    }
}