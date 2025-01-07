#### Tokyo syslog Server


resource "aws_instance" "cloudmaraduers-Aus-sysserver" {
  ami           = "ami-0146fc9ad419e2cfd" 
  instance_type = "t2.micro"              
                    
    

  subnet_id = aws_subnet.CloudMaraduers-Aus-11.id
  vpc_security_group_ids = [aws_security_group.CloudMaraduers-Aus-SG-TG02.id] 

  tags = {
    Name = ""
    Owner = "CloudMaraduers"
    ring = "dev"
  }
}

