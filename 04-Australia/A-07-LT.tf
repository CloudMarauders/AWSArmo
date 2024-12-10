

resource "aws_launch_template" "CloudMarauders-LT-Aus-80" {
  name = "CloudMarauders-LT-Aus-80"
  image_id = "ami-0146fc9ad419e2cfd"
  instance_type = "t2.micro"


   /* iam_instance_profile {
      name = aws_iam_instance_profile.syslog_instance_profile.name
    }
    key_name = "basiclinux-Aus"*/
    vpc_security_group_ids = [aws_security_group.CloudMaraduers-Aus-SG-TG01.id, aws_security_group.CloudMaraduers-Aus-SG-TG02.id]






user_data = base64encode(<<-EOT
#!/bin/bash
yum update -y
yum install -y rsyslog

systemctl enable rsyslog
systemctl start rsyslog


systemctl restart rsyslog
EOT
)


  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "CloudMarauders-Aus-80"
      Owner = "CloudMarauders"
      ring = "prod"
    }
  }
}