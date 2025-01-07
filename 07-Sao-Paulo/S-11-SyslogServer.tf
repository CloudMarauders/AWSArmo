#### Tokyo syslog Server


resource "aws_instance" "cloudmaraduers-Sao-sysserver" {
  ami           = "ami-0c820c196a818d66a" 
  instance_type = "t2.micro"              
                    
     

  subnet_id = aws_subnet.CloudMaraduers-Sao-11.id
  vpc_security_group_ids = [aws_security_group.CloudMaraduers-Sao-SG-TG02.id] 

  tags = {
    Name = ""
    Owner = "CloudMaraduers"
    ring = "dev"
  }
}

