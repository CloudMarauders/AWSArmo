


resource "aws_vpc" "CloudMaraduers-London-TMMC" {
  cidr_block = "172.44.0.0/16"


  tags = {
    Name = "CloudMaraduers-London-TMMC"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
}