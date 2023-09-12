# data "aws_ami" "ami_id" {
#     most_recent = true
#     owners = ["amazon"]
#     filter {
#         name = "name"
#         values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
#     }
# }

# output "ami_id" {
#     value = data.aws_ami.ami_id.id  
# }
