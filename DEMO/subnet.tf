# resource "aws_subnet" "main" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.1.0/24"
# }
# resource "aws_subnet" "main2" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.2.0/24"

#   tags = {
#     Name = "Main"
#   }
# }

# resource "aws_route_table_association" "a" {
#   subnet_id      = aws_subnet.main.id
#   route_table_id = aws_route_table.example.id
# }

# resource "aws_route_table_association" "b" {
#   subnet_id      = aws_subnet.main2.id
#   route_table_id = aws_route_table.example.id
# }