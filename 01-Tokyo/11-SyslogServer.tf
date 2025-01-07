#### Tokyo syslog Server


resource "aws_instance" "cloudmaraduers-tokyo-sysserver" {
  ami           = "ami-023ff3d4ab11b2525" 
  instance_type = "t2.micro"              
                    
    key_name      = "basiclinux-tokyo" 

  subnet_id = aws_subnet.CloudMaraduers-Tokyo-11.id
  vpc_security_group_ids = [aws_security_group.CloudMaraduers-Tokyo-SG-TG03.id] 

  tags = {
    Name = ""
    Owner = "CloudMaraduers"
    ring = "dev"
  }
}

