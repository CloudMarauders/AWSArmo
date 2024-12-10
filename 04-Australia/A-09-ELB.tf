

resource "aws_lb" "CloudMaraduers-Aus-ALB" {
  name               = "CloudMaraduers-LB-Aus"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.CloudMaraduers-Aus-SG-TG01.id, aws_security_group.CloudMaraduers-Aus-SG-TG02.id]
  subnets            = [aws_subnet.CloudMaraduers-Aus-01.id, aws_subnet.CloudMaraduers-Aus-02.id]

  enable_deletion_protection = false

  tags = {
        name = "CloudMaraduers-Aus-ALB"
        Owner = "CloudMaraduers"
        ring = "prod"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.CloudMaraduers-Aus-ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.CloudMaraduers-Aus-TG-80.arn
  }
}







