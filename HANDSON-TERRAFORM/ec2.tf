# # Creating 3 EC2 Instances:

# ####################################################################

# resource "aws_instance" "instance" {
#   count                = length(aws_subnet.public_subnet.*.id)
#   ami                  = var.ami_id
#   instance_type        = var.instance_type
#   subnet_id            = element(aws_subnet.public_subnet.*.id, count.index)
#   security_groups      = [aws_security_group.sg.id, ]
#   key_name             = "mykey"

#   tags = {
#     "Name"        = "Instance-${count.index}"
#     "Environment" = "Test"
#     "CreatedBy"   = "Terraform"
#   }



#   timeouts {
#     create = "10m"
#   }
#   user_data = <<-EOF
# #!/bin/bash
# sudo yum update -y
# sudo yum install httpd -y
# sudo systemctl start httpd
# sudo systemctl enable httpd
# sudo bash -c 'echo keep working results coming soonest > /var/www/html/index.html'
# EOF

# }

# resource "null_resource" "null" {
#   count = length(aws_subnet.public_subnet.*.id)


#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /home/ec2-user/userdata.sh",
#       "sh /home/ec2-user/userdata.sh",
#     ]
#     on_failure = continue
#   }

#   connection {
#     type        = "http"
#     user        = "ec2-user"
#     port        = "80"
#     host        = element(aws_eip.eip.*.public_ip, count.index)
#   }

# }



# ####################################################################

# # Creating 3 Elastic IPs:

# ####################################################################

# resource "aws_eip" "eip" {
#   count            = length(aws_instance.instance.*.id)
#   instance         = element(aws_instance.instance.*.id, count.index)
#   public_ipv4_pool = "amazon"
#   vpc              = true

#   tags = {
#     "Name" = "EIP-${count.index}"
#   }
# }

# ####################################################################

# # Creating EIP association with EC2 Instances:

# ####################################################################

# resource "aws_eip_association" "eip_association" {
#   count         = length(aws_eip.eip)
#   instance_id   = element(aws_instance.instance.*.id, count.index)
#   allocation_id = element(aws_eip.eip.*.id, count.index)
# }