# Create a security group for EC2

# resource "aws_security_group" "my-sg" {
#   name        = "my-sg"
#   description = "Security group for my resources"
#   vpc_id      = var.vpc_id

#   ingress {
#     description = "SSH"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "my-sg"
#   }
# }