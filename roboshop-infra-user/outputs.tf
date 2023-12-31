# output "azs" {
#   value = module.vpc.azs
# }
########################################################################################
output "vpc_id" {
  value = module.vpc.vpc_id # module.<name>.<output-variable-name>
 }

output "public_subnet_ids" {
  value = local.public_subnet_ids
}

output "private_subnet_ids" {
  value = local.private_subnet_ids
}

output "database_subnet_ids" {
  value = local.database_subnet_ids
}

# output "ami_id" {
#   value = data.aws_ami.devops.id 
# }

# output "ips" {
#   value = local.ips
# }

#output "testing-update" {
#     value = module.vpc.some_update
# }


#for latest update module terraform init -reconfigure