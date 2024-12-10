#### Tokyo syslog Server


resource "aws_instance" "cloudmaraduers-HK-sysserver" {
  ami           = "ami-06f707739f2271995" 
  instance_type = "t3.micro"              
                    
    

  subnet_id = aws_subnet.CloudMaraduers-HK-11.id
  vpc_security_group_ids = [aws_security_group.CloudMaraduers-HK-SG-TG02.id] 

  tags = {
    Name = ""
    Owner = "CloudMaraduers"
    ring = "dev"
  }
}

