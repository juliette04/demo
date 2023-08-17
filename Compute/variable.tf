# variable "subnet_prefix" {
#   description = "cidr block for the subnet"

# }

# variable "ami" {
#   description = "variable for my web instance server"
#   type        = string
#   default     = "ami-0dfcb1ef8550277af"

# }

# Variable.tf for ELB


# variable "subnet_id1" {
#   default = "subnet-06c788c88aad4c100"
# }
# variable "subnet_id2" {
#   default = "subnet-0d9865182835e005a"
# }
# variable "vpc_id" {
#   default = "vpc-0570d188b1ea3401d"
# }

# # Variable.tf (for webserver ec2)

# variable "ami" {
#   description = "ami for webserver instance"
#   type        = string
#   default     = "ami-0dfcb1ef8550277af"
# }

# variable "instance_type" {
#   description = "instance type for webserver"
#   type        = list(any)
#   default     = ["t2.micro", "t2.nano", "t3.micro"]
# }
# variable "tags" {
#   description = "tag for webserver"
#   type        = map(any)
#   default = {
#     name        = "helloid"
#     Project     = "terraform_project"
#     Environment = "Prod"
#   }
# }
# variable "associate_public_ip_address" {
#   description = "do want to choose pub ip for webserver"
#   type        = bool
#   default     = true
# }