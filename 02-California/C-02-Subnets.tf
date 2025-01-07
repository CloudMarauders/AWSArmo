

resource "aws_subnet" "CloudMaraduers-CA-01" {
  vpc_id                  = aws_vpc.CloudMaraduers-CA-TMMC.id
  cidr_block              = "172.8.1.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-CA-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-CA-02" {
  vpc_id                  = aws_vpc.CloudMaraduers-CA-TMMC.id
  cidr_block              = "172.8.2.0/24"
  availability_zone       = "us-west-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-CA-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}


################################################## Private Subnets ##################################################
resource "aws_subnet" "CloudMaraduers-CA-11" {
  vpc_id                  = aws_vpc.CloudMaraduers-CA-TMMC.id
  cidr_block              = "172.8.11.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-CA-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-CA-12" {
  vpc_id                  = aws_vpc.CloudMaraduers-CA-TMMC.id
  cidr_block              = "172.8.12.0/24"
  availability_zone       = "us-west-1c"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-CA-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-CA-13" {
  vpc_id                  = aws_vpc.CloudMaraduers-CA-TMMC.id
  cidr_block              = "172.8.13.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-CA-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}
