# resource "aws_instance" "ec2_module" {
#     ami = var.ami_id_module
#     instance_type = var.instance_type_module
#     vpc_security_group_ids = [var.security-group ]
#     tags = {
#       Name ="${terraform.workspace}-instance"
#     }
# }