

resource "aws_lb" "CloudMaraduers-CA-ALB" {
  name               = "CloudMaraduers-LB-CA"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.CloudMaraduers-CA-SG-TG01.id, aws_security_group.CloudMaraduers-CA-SG-TG02.id]
  subnets            = [aws_subnet.CloudMaraduers-CA-01.id, aws_subnet.CloudMaraduers-CA-02.id]

  enable_deletion_protection = false

  tags = {
        name = "CloudMaraduers-CA-ALB"
        Owner = "CloudMaraduers"
        ring = "prod"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.CloudMaraduers-CA-ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.CloudMaraduers-CA-TG-80.arn
  }
}







