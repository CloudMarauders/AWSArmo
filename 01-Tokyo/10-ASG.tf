

resource "aws_autoscaling_group" "CloudMaraduers-Tokyo80" {
  name                      = "CloudMaraduers-auto-scaling-group-tokyo80"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  target_group_arns         = [aws_lb_target_group.CloudMaraduers-Tokyo-TG-80.arn]
  vpc_zone_identifier       = [aws_subnet.CloudMaraduers-Tokyo-01.id, aws_subnet.CloudMaraduers-Tokyo-02.id]

  launch_template {
    id      = aws_launch_template.CloudMarauders-LT-Tokyo-80.id
    version = "$Latest"
}

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances",
  ]

initial_lifecycle_hook {
    name                 = "instance-protection-launch"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 60
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
    notification_metadata = "{\"key\":\"value\"}"
    }

initial_lifecycle_hook {
    name                 = "scale-in-protection"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 300
    lifecycle_transition = "autoscaling:EC2_INSTANCE_TERMINATING"
    }

tag {
    key                 = "Name"
    value               = "CloudMarauders-Tokyo"
    propagate_at_launch = true
  }

tag {
    key                 = "Environment"
    value               = "prod"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "asg88" {
  name                      = "CloudMarauders-cpu-target"
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 120
  autoscaling_group_name    = aws_autoscaling_group.CloudMaraduers-Tokyo80.name

  target_tracking_configuration {
        predefined_metric_specification {
        predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 75.0
    }

}
resource "aws_autoscaling_attachment" "CloudMarauders-Tokyo-attachment" {
  autoscaling_group_name = aws_autoscaling_group.CloudMaraduers-Tokyo80.name
  lb_target_group_arn   = aws_lb_target_group.CloudMaraduers-Tokyo-TG-80.arn

}


###########################################################443



