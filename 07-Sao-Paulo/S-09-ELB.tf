

resource "aws_lb" "CloudMaraduers-Sao-ALB" {
  name               = "CloudMaraduers-LB-Sao"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.CloudMaraduers-Sao-SG-TG01.id, aws_security_group.CloudMaraduers-Sao-SG-TG02.id]
  subnets            = [aws_subnet.CloudMaraduers-Sao-01.id, aws_subnet.CloudMaraduers-Sao-02.id]

  enable_deletion_protection = false

  tags = {
        name = "CloudMaraduers-Sao-ALB"
        Owner = "CloudMaraduers"
        ring = "prod"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.CloudMaraduers-Sao-ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.CloudMaraduers-Sao-TG-80.arn
  }
}







