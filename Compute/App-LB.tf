# Main.tf


# provider "aws" {
#   region = "us-east-1"
# }
# resource "aws_lb" "my-test-lb" {
#   name               = "my-test-lb1"
#   internal           = false
#   load_balancer_type = "application"
#   ip_address_type    = "ipv4"
#   subnets            = ["${var.subnet_id1}", "${var.subnet_id2}"]
#   enable_deletion_protection = true
# }
# resource "aws_security_group" "alb-sg1" {
#   name   = "my-alb-sg1"
#   vpc_id = var.vpc_id
# }
# resource "aws_security_group_rule" "http_allow" {
#   from_port         = 80
#   protocol          = "tcp"
#   security_group_id = "sg-0ecc5f6253dac6401"
#   to_port           = 80
#   type              = "ingress"
#   cidr_blocks       = ["0.0.0.0/0"]
# }



