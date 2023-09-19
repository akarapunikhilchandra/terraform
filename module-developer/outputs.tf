# output "azs" {
#   value = local.azs
# }

output "vpc_id" {
    value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "database_subnet_ids" {
  value = aws_subnet.database[*].id
}
# if there is any update mentioned below
#  output "some_update" {
#    value = "updated again"
#  }