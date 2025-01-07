

resource "aws_lb" "CloudMaraduers-Tokyo-ALB" {
  name               = "CloudMaraduers-LB-Tokyo"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.CloudMaraduers-Tokyo-SG-TG01.id, aws_security_group.CloudMaraduers-Tokyo-SG-TG02.id]
  subnets            = [aws_subnet.CloudMaraduers-Tokyo-01.id, aws_subnet.CloudMaraduers-Tokyo-02.id]

  enable_deletion_protection = false

  tags = {
        name = "CloudMaraduers-Tokyo-ALB"
        Owner = "CloudMaraduers"
        ring = "prod"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.CloudMaraduers-Tokyo-ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.CloudMaraduers-Tokyo-TG-80.arn
  }
}







