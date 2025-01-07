

resource "aws_lb" "CloudMaraduers-London-ALB" {
  name               = "CloudMaraduers-LB-London"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.CloudMaraduers-London-SG-TG01.id, aws_security_group.CloudMaraduers-London-SG-TG02.id]
  subnets            = [aws_subnet.CloudMaraduers-London-01.id, aws_subnet.CloudMaraduers-London-02.id]

  enable_deletion_protection = false

  tags = {
        name = "CloudMaraduers-London-ALB"
        Owner = "CloudMaraduers"
        ring = "prod"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.CloudMaraduers-London-ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.CloudMaraduers-London-TG-80.arn
  }
}







