


resource "aws_vpc" "CloudMaraduers-Sao-TMMC" {
  cidr_block = "172.55.0.0/16"


  tags = {
    Name = "CloudMaraduers-Sao-TMMC"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
}