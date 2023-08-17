# variable "aws_subnet_id" {
#   type = list
#   default = ["subnet-0616c5751b33540c3","subnet-0659b1262ce5c8371"]
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

# variable "aws_security_group_name" {
#     type = string
#     default = "allow_tls"
  
# }
#ec2 variable
# variable "instance_type" {}
# variable "cidr_block" {}

#s3 variable for jluma

# variable "named_folder" {
#     type = string
#     default = "multiple-s3-files"

# }

# resource "aws_s3_bucket_object" "base_folder" {
#     bucket = aws_s3_bucket.jluma.id
#     acl = "private"
#     key = "${var.named_folder}/"
#     content_type = "application/x-directory"

# }

#variable for iam user

# variable "username" {
#   type = set(string)
#   default = ["moni","luma","jolie"]
#

# variable "user_names" {
#   description = "IAM usernames"
#   type        = list(string)
#   default     = ["lum1", "lum2", "lum3", "lum4"]
# }

variable "aws_vpc" {
    type = string
    default = "vpc-0570d188b1ea3401d"
  
}

variable "aws_subnet_id" {
    type = string
    default = "subnet-06c788c88aad4c100"
  
}