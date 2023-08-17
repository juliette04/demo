# # resource "aws_instance" "webserver" {
# #   ami           = var.ami
# #   instance_type = var.instance_type[2]
# #   associate_public_ip_address = var.associate_public_ip_address
# #     count = 2
# #   key_name = "mykey"
# #   tags = var.tags
# #   user_data = <<-EOF
# # #!/bin/bash
# # sudo yum update -y
# # sudo yum install httpd -y
# # sudo systemctl start httpd
# # sudo systemctl enable httpd
# # sudo bash -c 'echo your very first web server > /var/www/html/index.html'
# # EOF

# # }

# # data "aws_ami" "ubuntu" {
# #   most_recent = true

# #   filter {
# #     name   = "name"
# #     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
# #   }

# #   filter {
# #     name   = "virtualization-type"
# #     values = ["hvm"]
# #   }

# #   owners = ["099720109477"]
# # }

# # resource "aws_instance" "web" {
# #   ami           = data.aws_ami.ubuntu.id
# #   instance_type = "t2.micro"
# #   count = 2
# #   key_name = "mykey"
# #   security_groups = ["aws_security_group.allow_tls.name"]

# #   user_data = <<-EOF
# #       !/bin/bash
# #       sudo yum update -y
# #       sudo yum install httpd -y
# #       sudo systemctl start httpd
# #       sudo systemctl enable httpd
# #       sudo bash -c 'echo keep working results coming soonest > /var/www/html/index.html'
# #       EOF

# #   tags = {
# #     Name = "HelloWorld"
# #   }
# # }

# EC2 instance
# resource "aws_instance" "web" {
# ami           = "ami-005f9685cb30f234b"
# instance_type = "t2.micro"
# key_name = "mykey"
# security_groups = [aws_security_group.ec2_security_group.name]

# tags = {
# Name = "WEB"
#  }
# provisioner "local-exec" {
# command = "echo ${aws_instance.web.public_ip} > publicIP.txt"
#   }
# }