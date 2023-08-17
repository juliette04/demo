# resource "aws_lb_target_group" "tg" {
#   name        = "tf-example-lb-tg"
#   target_type = "instance"
#   port        = 80
#   protocol    = "HTTP"
#   vpc_id      = aws_vpc.main.id
# }

# resource "aws_lb" "test-lb" {
#   name               = "test-lb-tf"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.allow_tls.id]
#   subnets            = var.aws_subnet_id

#   tags = {
#     Environment = "production"
#   }
# }

# resource "aws_lb_listener" "front_end" {
#   load_balancer_arn = aws_lb.test-lb.arn
#   port              = "80"
#   protocol          = "HTTP"
#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.tg.arn
#   }
# }

# resource "aws_lb_target_group_attachment" "test" {
#     count = length(aws_instance.webserver)
#   target_group_arn = aws_lb_target_group.tg.arn
#   target_id        = aws_instance.webserver[count.index].id
# }