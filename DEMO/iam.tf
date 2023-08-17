# resource "aws_iam_user" "demo" {
#   count = "${length(var.username)}"
#   name = "${element(var.username,count.index )}"
# }

# resource "aws_iam_user_policy" "newemp_policy" {
#   count = length(var.username)
#   name = "AdminAccess"
#   user = element(var.username,count.index)
# policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": "*",
#             "Resource": "*"
#         }
#     ]
# }
# EOF
# }

# resource "aws_iam_group" "developers" {
#   name = "developers"
# }

# resource "aws_iam_group_membership" "developers-Users" {
#         name = "developers-users"
#     users = [
#         "${aws_iam_user.moni1.name}",
#         "${aws_iam_user.luma2.name}",
#         "${aws_iam_user.jolie.name}",
#         "${aws_iam_user.luma3.name}",
#         "${aws_iam_user.luma4.name}",
#         "${aws_iam_user.moni2.name}",

#     ]
#     group = "${aws_iam_group.developers.name}"
# }

#   resource "aws_iam_policy_attachment" "developers-attach" {
#     name = "developers-attach"
#     groups = ["${aws_iam_group.developers.name}"]
#     policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
# }


#count iam_user creation & policy creation
##########################################
# resource "aws_iam_user" "lum" {
#   count = 4 
#   name = element(var.user_names,count.index )
# }


# resource "aws_iam_user_policy" "newemp_policy" {
#   count = length(var.user_names)
#   name = "AdminAccess"
#   user = element(var.user_names,count.index)
# policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": "*",
#             "Resource": "*"
#         }
#     ]
# }
# EOF
# }


# # create users
# resource "aws_iam_user" "moni1" {
#     name = "moni1"
# }

