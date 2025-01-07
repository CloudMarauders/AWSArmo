


resource "aws_vpc" "CloudMaraduers-Aus-TMMC" {
  cidr_block = "172.61.0.0/16"


  tags = {
    Name = "CloudMaraduers-Aus-TMMC"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
}