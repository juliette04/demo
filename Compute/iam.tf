# Main.tf


# resource "aws_iam_user" "example" {
#   count = length(var.username)
#   name  = element(var.username, count.index)
# }


# Output.tf

# output "user_arn" {
#   value = aws_iam_user.example.*.arn
# }


# Variable.tf


# variable "username" {
#   type    = list(any)
#   default = ["moni", "julie", "luma"]
# }