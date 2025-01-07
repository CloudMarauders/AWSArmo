

resource "aws_subnet" "CloudMaraduers-NY-01" {
  vpc_id                  = aws_vpc.CloudMaraduers-NY-TMMC.id
  cidr_block              = "172.42.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-NY-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-NY-02" {
  vpc_id                  = aws_vpc.CloudMaraduers-NY-TMMC.id
  cidr_block              = "172.42.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "CloudMaraduers-NY-TMMC-public"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}


################################################## Private Subnets ##################################################
resource "aws_subnet" "CloudMaraduers-NY-11" {
  vpc_id                  = aws_vpc.CloudMaraduers-NY-TMMC.id
  cidr_block              = "172.42.11.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-NY-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "CloudMaraduers-NY-12" {
  vpc_id                  = aws_vpc.CloudMaraduers-NY-TMMC.id
  cidr_block              = "172.42.12.0/24"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = false

  tags = {
    Name    = "CloudMaraduers-NY-TMMC-private"
    Owner   = "CloudMaraduers"
    ring  = "prod"
  }
}


resource "aws_subnet" "CloudMaraduers-NY-13" {
  vpc_id                  = aws_vpc.CloudMaraduers-NY-TMMC.id
  cidr_block              = "172.42.13.0/24"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = false
  
}