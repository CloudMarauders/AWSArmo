

resource "aws_lb" "CloudMaraduers-HK-ALB" {
  name               = "CloudMaraduers-LB-HK"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.CloudMaraduers-HK-SG-TG01.id, aws_security_group.CloudMaraduers-HK-SG-TG02.id]
  subnets            = [aws_subnet.CloudMaraduers-HK-01.id, aws_subnet.CloudMaraduers-HK-02.id]

  enable_deletion_protection = false

  tags = {
        name = "CloudMaraduers-HK-ALB"
        Owner = "CloudMaraduers"
        ring = "prod"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.CloudMaraduers-HK-ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.CloudMaraduers-HK-TG-80.arn
  }
}







