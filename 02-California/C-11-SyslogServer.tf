#### Tokyo syslog Server


resource "aws_instance" "cloudmaraduers-CA-sysserver" {
  ami           = "ami-038bba9a164eb3dc1" 
  instance_type = "t2.micro"              
                    
    

  subnet_id = aws_subnet.CloudMaraduers-CA-11.id
  vpc_security_group_ids = [aws_security_group.CloudMaraduers-CA-SG-TG02.id] 

  tags = {
    Name = ""
    Owner = "CloudMaraduers"
    ring = "dev"
  }
}

