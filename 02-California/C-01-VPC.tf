


resource "aws_vpc" "CloudMaraduers-CA-TMMC" {
  cidr_block = "172.8.0.0/16"


  tags = {
    Name = "CloudMaraduers-CA-TMMC"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
}