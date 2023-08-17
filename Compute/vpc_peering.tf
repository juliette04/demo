# resource "aws_vpc_peering_connection" "jolie" {
#   peer_vpc_id = aws_vpc.luma.id
#   vpc_id      = aws_vpc.jolie.id
#   auto_accept = true

#   tags = {
#     Name = "VPC Peering between jolie and luma"
#   }
# }

# resource "aws_vpc" "jolie" {
#   cidr_block = "10.1.0.0/16"
#   tags = {
#     name = "jolie"
#   }
# }

# resource "aws_vpc" "luma" {
#   cidr_block = "10.2.0.0/16"
#   tags = {
#     name = "luma"
#   }
# }
