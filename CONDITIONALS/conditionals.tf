# resource "aws_instance" "webserver" {
#   count = var.isPROD ? 1 : 0
#   ami           = "ami-0735c191cf914754d"
#   instance_type = "t2.micro"
#   tags = {
#     Name        = "jjtech-server"
#     Environment = "prod"
#     created-by  = "terraform"
#   }
# }



######################################################
###if/else
######################################################

# resource "aws_instance" "webserver-prod" {
#   count         = var.Environment[0] == "prod" ? 1 : 0
#   ami           = "ami-0735c191cf914754d"
#   instance_type = "t4.xlarge"
#   tags = {
#     Name        = "jjtech-server"
#     Environment = "prod"
#     created-by  = "terraform"
#   }
# }

# resource "aws_instance" "webserver-dev" {
#   count         = var.Environment[1] == "dev" ? 1 : 0
#   ami           = "ami-0735c191cf914754d"
#   instance_type = "t2.micro"
#   tags = {
#     Name        = "jjtech-server"
#     Environment = "dev"
#     created-by  = "terraform"
#   }
# }