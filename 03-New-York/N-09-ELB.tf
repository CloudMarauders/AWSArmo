

resource "aws_lb" "CloudMaraduers-NY-ALB" {
  name               = "CloudMaraduers-LB-NY"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.CloudMaraduers-NY-SG-TG01.id, aws_security_group.CloudMaraduers-NY-SG-TG02.id]
  subnets            = [aws_subnet.CloudMaraduers-NY-01.id, aws_subnet.CloudMaraduers-NY-02.id]

  enable_deletion_protection = false

  tags = {
        name = "CloudMaraduers-NY-ALB"
        Owner = "CloudMaraduers"
        ring = "prod"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.CloudMaraduers-NY-ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.CloudMaraduers-NY-TG-80.arn
  }
}







