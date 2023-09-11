data "aws_vpc" "default" {
    default = true
}

output "vpc_info" {
    value = data.aws_vpc.default  
}