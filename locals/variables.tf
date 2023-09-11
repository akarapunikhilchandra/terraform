variable "isPROD" {
    default = false
}

# variable "tags" {
#     default = {
#         Name = "mongodb"
#     }
# }

variable "instance_names" {
    type = list 
    default = ["mongodb", "catalogue", "web"]
}