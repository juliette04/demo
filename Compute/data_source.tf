# data "aws_ami" "linux2" {
#   most_recent = true

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   filter {
#     name = "name"
#     values = ["amzn2-ami-kernel-5.10-hvm-2.0.20230207.0-x86_64-gp2"]

#   }

#   owners = ["amazon"] 
# }


# resource "aws_instance" "web" {
#   ami           = data.aws_ami.linux2.id
#   instance_type = "t3.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
# }


# data "aws_vpc" "jjtech" {
#   id = "vpc-0570d188b1ea3401d"
# }

# output "vpc-arn" {
#     value = data.aws_vpc.jjtech.arn

# }

# output "ipv6" {
#     value = data.aws_vpc.jjtech.ipv6_association_id

# }

# output "own_id" {
#     value = data.aws_vpc.jjtech.owner_id

# }

# resource "aws_security_group" "web_server_sg_tf" {
#  name        = "web-server-sg-tf"
#  description = "Allow HTTPS to web server"
#  vpc_id      = data.aws_vpc.jjtech.id

# ingress {
#    description = "HTTPS ingress"
#    from_port   = 443
#    to_port     = 443
#    protocol    = "tcp"
#    cidr_blocks = [ data.aws_vpc.jjtech.cidr_block ]
#  }

# ingress {
#   cidr_blocks = ["0.0.0.0/0"]
#   description = "http ingress"
#   protocol    = "tcp"
#   from_port = 80
#   to_port = 80
# }



# egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
# }