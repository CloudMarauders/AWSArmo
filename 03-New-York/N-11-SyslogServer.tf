#### Tokyo syslog Server


resource "aws_instance" "cloudmaraduers-NY-sysserver" {
  ami           = "ami-0453ec754f44f9a4a" 
  instance_type = "t2.micro"              
                    
    

  subnet_id = aws_subnet.CloudMaraduers-NY-11.id
  vpc_security_group_ids = [aws_security_group.CloudMaraduers-NY-SG-TG02.id] 

  tags = {
    Name = ""
    Owner = "CloudMaraduers"
    ring = "dev"
  }
}

