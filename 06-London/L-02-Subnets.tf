

resource "aws_subnet" "CloudMaraduers-London-01" {
  vpc_id                  = aws_vpc.CloudMaraduers-London-TMMC.id
  cidr_block              = "172.44.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-London-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-London-02" {
  vpc_id                  = aws_vpc.CloudMaraduers-London-TMMC.id
  cidr_block              = "172.44.2.0/24"
  availability_zone       = "eu-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-London-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}


################################################## Private Subnets ##################################################
resource "aws_subnet" "CloudMaraduers-London-11" {
  vpc_id                  = aws_vpc.CloudMaraduers-London-TMMC.id
  cidr_block              = "172.44.11.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-London-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-London-12" {
  vpc_id                  = aws_vpc.CloudMaraduers-London-TMMC.id
  cidr_block              = "172.44.12.0/24"
  availability_zone       = "eu-west-2c"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-London-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-London-13" {
  vpc_id                  = aws_vpc.CloudMaraduers-London-TMMC.id
  cidr_block              = "172.44.13.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-London-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}
