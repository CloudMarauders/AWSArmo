


resource "aws_vpc" "CloudMaraduers-NY-TMMC" {
  cidr_block = "172.42.0.0/16"


  tags = {
    Name = "CloudMaraduers-NY-TMMC"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
}