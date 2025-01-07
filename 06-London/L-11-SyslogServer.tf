#### Tokyo syslog Server


resource "aws_instance" "cloudmaraduers-London-sysserver" {
  ami           = "ami-0c76bd4bd302b30ec" 
  instance_type = "t2.micro"              
                    
     

  subnet_id = aws_subnet.CloudMaraduers-London-11.id
  vpc_security_group_ids = [aws_security_group.CloudMaraduers-London-SG-TG02.id] 

  tags = {
    Name = ""
    Owner = "CloudMaraduers"
    ring = "dev"
  }
}

