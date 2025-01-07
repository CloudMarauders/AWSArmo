

resource "aws_subnet" "CloudMaraduers-Tokyo-01" {
  vpc_id                  = aws_vpc.CloudMaraduers-Tokyo-TMMC.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-Tokyo-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-Tokyo-02" {
  vpc_id                  = aws_vpc.CloudMaraduers-Tokyo-TMMC.id
  cidr_block              = "172.16.2.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-Tokyo-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}


################################################## Private Subnets ##################################################
resource "aws_subnet" "CloudMaraduers-Tokyo-11" {
  vpc_id                  = aws_vpc.CloudMaraduers-Tokyo-TMMC.id
  cidr_block              = "172.16.11.0/24"
  availability_zone       = "ap-northeast-1d"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-Tokyo-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-Tokyo-12" {
  vpc_id                  = aws_vpc.CloudMaraduers-Tokyo-TMMC.id
  cidr_block              = "172.16.12.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-Tokyo-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-Tokyo-13" {
  vpc_id                  = aws_vpc.CloudMaraduers-Tokyo-TMMC.id
  cidr_block              = "172.16.13.0/24"
  availability_zone       = "ap-northeast-1d"
  map_public_ip_on_launch = false
  
}