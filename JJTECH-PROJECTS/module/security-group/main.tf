# # resource "aws_security_group" "module_sg_tf" {
# #  name        = "${terraform.workspace}-module"
# #  description = "Allow HTTPS to web server"
# #  #vpc_id      = data.aws_vpc.default.id

# # ingress {
# #   cidr_blocks = ["0.0.0.0/0"]
# #   description = "http ingress"
# #   protocol    = "tcp"
# #   from_port = 80
# #   to_port = 80
# # }

# # egress {
# #    from_port   = 0
# #    to_port     = 0
# #    protocol    = "-1"
# #    cidr_blocks = ["0.0.0.0/0"]
# #  }
# # }

# resource "aws_security_group" "sg_22" {
#   name = "sg_22"
#   vpc_id = "${aws_vpc.vpc.id}"

#   # SSH access from the VPC
#   ingress {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags {
#     Environment = "${var.environment_tag}"
#   }
# }