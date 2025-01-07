

resource "aws_subnet" "CloudMaraduers-Sao-01" {
  vpc_id                  = aws_vpc.CloudMaraduers-Sao-TMMC.id
  cidr_block              = "172.55.1.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-Sao-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-Sao-02" {
  vpc_id                  = aws_vpc.CloudMaraduers-Sao-TMMC.id
  cidr_block              = "172.55.2.0/24"
  availability_zone       = "sa-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-Sao-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}


################################################## Private Subnets ##################################################
resource "aws_subnet" "CloudMaraduers-Sao-11" {
  vpc_id                  = aws_vpc.CloudMaraduers-Sao-TMMC.id
  cidr_block              = "172.55.11.0/24"
  availability_zone       = "sa-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-Sao-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-Sao-12" {
  vpc_id                  = aws_vpc.CloudMaraduers-Sao-TMMC.id
  cidr_block              = "172.55.12.0/24"
  availability_zone       = "sa-east-1c"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-Sao-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-Sao-13" {
  vpc_id                  = aws_vpc.CloudMaraduers-Sao-TMMC.id
  cidr_block              = "172.55.13.0/24"
  availability_zone       = "sa-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-Sao-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}
