# 
# resource "aws_vpc" "mytest-vpc" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "production"
#   }
# }

# resource "aws_subnet" "subnet-1" {
#   vpc_id            = aws_vpc.mytest-vpc.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"

#   tags = {
#     Name = "prod-subnet"
#   }

# }

# resource "aws_subnet" "subnet-2" {
#   vpc_id            = aws_vpc.mytest-vpc.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-1a"

#   tags = {
#     Name = "dev-subnet"
#   }
# }
# resource "aws_route_table_association" "a" {
#   subnet_id      = aws_subnet.subnet-1.id
#   route_table_id = aws_route_table.example.id
# }

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.mytest-vpc.id

#   tags = {
#     Name = "main"
#   }
# }

# resource "aws_route_table" "example" {
#   vpc_id = aws_vpc.mytest-vpc.id

#   route {
#     cidr_block = "10.0.1.0/24"
#     gateway_id = aws_internet_gateway.igw.id
#   }


#   tags = {
#     Name = "example"
#   }
# }

# resource "aws_security_group" "allow_web" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.mytest-vpc.id

#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = [aws_vpc.mytest-vpc.cidr_block]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }


# resource "aws_network_interface" "webserver-ju" {
#   subnet_id       = aws_subnet.subnet-1.id
#   private_ip      = ["10.0.1.40"]
#   security_groups = [aws_security_group.allow_web.id]

# }

# resource "aws_eip" "one" {
#   vpc                       = true
#   network_interface         = aws_network_interface.webserver-ju.id
#   associate_with_private_ip = "10.0.1.40"
#   depends_on                = [aws_internet_gateway.igw]

# }

# resource "aws_instance" "myweb-instance" {
#   ami               = "ami-0dfcb1ef8550277af"
#   instance_type     = "t2.micro"
#   availability_zone = "us-east-1a"
#   key_name          = "mykey"

#   network_interface {
#     device_index         = 0
#     network_interface_id = aws_network_interface.webserver-ju.id
#   }

#   user_data = <<-EOF
#   #!/bin/bash
# sudo yum update -y
# sudo yum install httpd -y
# sudo systemctl start httpd
# sudo systemctl enable httpd
# sudo bash -c 'echo keep working results coming soonest > /var/www/html/index.html'
# EOF
# }


# resource "aws_instance" "web" {
#   ami           = var.ami
#   instance_type = var.instance_type[2]
#   user_data     = <<-EOF
# #!/bin/bash
# sudo yum update -y
# sudo yum install httpd -y
# sudo systemctl start httpd
# sudo systemctl enable httpd
# sudo bash -c 'echo your very first web server > /var/www/html/index.html'
# EOF

# }

# # Create a VPC
# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = "main"
#   }
# }

# # Create a public subnet
# resource "aws_subnet" "public-a" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "10.0.0.0/24"
#   availability_zone       = "us-east-1a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "public-a"
#   }
# }

# # # Create a private subnet
# # resource "aws_subnet" "private-b" {
# #   vpc_id                  = aws_vpc.main.id
# #   cidr_block              = "10.0.1.0/24"
# #   availability_zone       = "us-east-1b"
# #   map_public_ip_on_launch = false

# #   tags = {
# #     Name = "private-b"
# #   }
# # }

# # resource "aws_internet_gateway" "gw" {
# #   vpc_id = aws_vpc.main.id

# #   tags = {
# #     Name = "igw"
# #   }
# # }







