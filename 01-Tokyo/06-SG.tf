

resource "aws_security_group" "CloudMaraduers-Tokyo-SG-TG01" {
  vpc_id = aws_vpc.CloudMaraduers-Tokyo-TMMC.id
    description = "HTTP"
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        name = "CloudMaraduers-Tokyo-SG-TG01"
        Owner = "CloudMaraduers"
        ring = "prod"
    }
}


#############################################Load Balancer

resource "aws_security_group" "CloudMaraduers-Tokyo-SG-TG02" {
  vpc_id = aws_vpc.CloudMaraduers-Tokyo-TMMC.id
    description = "Syslogs"
  
  ingress {
    description = "Syslogs"
    from_port = 514
    to_port = 514
    protocol = "udp"
    cidr_blocks = ["172.16.0.0/16"]
  }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["172.16.0.0/16"]
    }

    tags = {
        name = "CloudMaraduers-Tokyo-SG-TG02"
        Owner = "CloudMaraduers"
        ring = "prod"
    }
}


########### Syslog incoming from other regions

resource "aws_security_group" "CloudMaraduers-Tokyo-SG-TG03" {
  vpc_id = aws_vpc.CloudMaraduers-Tokyo-TMMC.id
    description = "Syslogs"
  
  ingress {
    description = "Syslogs"
    from_port = 514
    to_port = 514
    protocol = "udp"
    cidr_blocks = ["172.16.0.0/16", "172.42.0.0/16", "172.8.0.0/16", "172.44.0.0/16", "172.55.0.0/16", "172.61.0.0/16", "172.83.0.0/16"]
  }


    tags = {
        name = "CloudMaraduers-Tokyo-SG-TG03"
        Owner = "CloudMaraduers"
        ring = "prod"
    }
}