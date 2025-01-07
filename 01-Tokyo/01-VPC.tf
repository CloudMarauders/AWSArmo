


resource "aws_vpc" "CloudMaraduers-Tokyo-TMMC" {
  cidr_block = "172.16.0.0/16"


  tags = {
    Name = "CloudMaraduers-Tokyo-TMMC"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
}