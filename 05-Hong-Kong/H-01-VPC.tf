


resource "aws_vpc" "CloudMaraduers-HK-TMMC" {
  cidr_block = "172.83.0.0/16"


  tags = {
    Name = "CloudMaraduers-HK-TMMC"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
}