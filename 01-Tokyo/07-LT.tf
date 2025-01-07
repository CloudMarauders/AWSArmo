

resource "aws_launch_template" "CloudMarauders-LT-Tokyo-80" {
  name = "CloudMarauders-LT-Tokyo-80"
  image_id = "ami-023ff3d4ab11b2525"
  instance_type = "t2.micro"


    /*iam_instance_profile {
      name = aws_iam_instance_profile.syslog_instance_profile.name
    }*/
    key_name = "basiclinux-tokyo"
    vpc_security_group_ids = [aws_security_group.CloudMaraduers-Tokyo-SG-TG01.id, aws_security_group.CloudMaraduers-Tokyo-SG-TG02.id]







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
      Name = "CloudMarauders-Tokyo-80"
      Owner = "CloudMarauders"
      ring = "prod"
    }
  }
}