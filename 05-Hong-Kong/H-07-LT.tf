

resource "aws_launch_template" "CloudMarauders-LT-HK-80" {
  name = "CloudMarauders-LT-HK-80"
  image_id = "ami-06f707739f2271995"
  instance_type = "t3.micro"


    /*iam_instance_profile {
      name = aws_iam_instance_profile.syslog_instance_profile.name
    }
    key_name = "basiclinux-HK"*/
    vpc_security_group_ids = [aws_security_group.CloudMaraduers-HK-SG-TG01.id, aws_security_group.CloudMaraduers-HK-SG-TG02.id]







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
      Name = "CloudMarauders-HK-80"
      Owner = "CloudMarauders"
      ring = "prod"
    }
  }
}