

resource "aws_subnet" "CloudMaraduers-Aus-01" {
  vpc_id                  = aws_vpc.CloudMaraduers-Aus-TMMC.id
  cidr_block              = "172.61.1.0/24"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-Aus-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-Aus-02" {
  vpc_id                  = aws_vpc.CloudMaraduers-Aus-TMMC.id
  cidr_block              = "172.61.2.0/24"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-Aus-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}


################################################## Private Subnets ##################################################
resource "aws_subnet" "CloudMaraduers-Aus-11" {
  vpc_id                  = aws_vpc.CloudMaraduers-Aus-TMMC.id
  cidr_block              = "172.61.11.0/24"
  availability_zone       = "ap-southeast-2c"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-Aus-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-Aus-12" {
  vpc_id                  = aws_vpc.CloudMaraduers-Aus-TMMC.id
  cidr_block              = "172.61.12.0/24"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-Aus-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-Aus-13" {
  vpc_id                  = aws_vpc.CloudMaraduers-Aus-TMMC.id
  cidr_block              = "172.61.13.0/24"
  availability_zone       = "ap-southeast-2c"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-Aus-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

