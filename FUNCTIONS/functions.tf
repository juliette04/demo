# locals {
#   timestamp = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
# }

# output "timestamp" {
#   value = local.timestamp
# }

# #Lookup function
# locals {
#   region       = "ca-central"
#   instance_type = ["t2.micro", "t2.nano", "t3.small"]
#   ami = {
#     us-east-1  = "us-east-ami"
#     us-west-2  = "us-west-ami"
#     ca-central = "ca-central-ami"
#   }
#   tags = {
#     Name    = "Test-server"
#     project = "jjtech-demo"
#   }
# }

## File function (path_to_file)
### Reads the content of a file as a string and can be used in conjunction with other 
### functions like jsondecode / yamldecode.

# locals {
#   a_file = file("./nginx.sh")
# }

# output "a_file" {
#   value = local.a_file
# }

# zipmap Function (key_list, value_list)
##Constructs a map from a list of keys and a list of values.

# locals {
#  key    = ["a", "b", "c"]
#  values = [1, 2, 3]
#  zip_map    = zipmap(local.key, local.values)
# }

# output "zip_map" {
#  value = local.zip_map
# }