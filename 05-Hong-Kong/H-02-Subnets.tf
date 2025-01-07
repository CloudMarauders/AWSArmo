

resource "aws_subnet" "CloudMaraduers-HK-01" {
  vpc_id                  = aws_vpc.CloudMaraduers-HK-TMMC.id
  cidr_block              = "172.83.1.0/24"
  availability_zone       = "ap-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-HK-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-HK-02" {
  vpc_id                  = aws_vpc.CloudMaraduers-HK-TMMC.id
  cidr_block              = "172.83.2.0/24"
  availability_zone       = "ap-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-HK-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}


################################################## Private Subnets ##################################################
resource "aws_subnet" "CloudMaraduers-HK-11" {
  vpc_id                  = aws_vpc.CloudMaraduers-HK-TMMC.id
  cidr_block              = "172.83.11.0/24"
  availability_zone       = "ap-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-HK-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-HK-12" {
  vpc_id                  = aws_vpc.CloudMaraduers-HK-TMMC.id
  cidr_block              = "172.83.12.0/24"
  availability_zone       = "ap-east-1c"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-HK-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-HK-13" {
  vpc_id                  = aws_vpc.CloudMaraduers-HK-TMMC.id
  cidr_block              = "172.83.13.0/24"
  availability_zone       = "ap-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-HK-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}
