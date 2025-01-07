

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-Aus-TMMC.id

  route {
    cidr_block                  = "0.0.0.0/0"
    nat_gateway_id              = aws_nat_gateway.Aus-nat.id
  }
  
  
  
  
  
  
  tags = {
    Name = "CloudMaraduers-Aus-Private-Route-Table"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
  
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-Aus-TMMC.id

  route {
    cidr_block                  = "0.0.0.0/0"
    gateway_id                  = aws_internet_gateway.Aus-igw.id
   
    
  }
  
  
  
  
  
  
  tags = {
    Name = "CloudMaraduers-Aus-Public-Route-Table"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
  
}

################################################## Private Subnets
resource "aws_route_table_association" "private-ap-northeast-1a" {
  subnet_id      = aws_subnet.CloudMaraduers-Aus-11.id
  route_table_id = aws_route_table.private_route_table.id
  
}

resource "aws_route_table_association" "private-ap-northeast-1c" {
  subnet_id      = aws_subnet.CloudMaraduers-Aus-12.id
  route_table_id = aws_route_table.private_route_table.id
  
}



################################################## Public Subnets

resource "aws_route_table_association" "public-ap-northeast-1a" {
  subnet_id      = aws_subnet.CloudMaraduers-Aus-01.id
  route_table_id = aws_route_table.public_route_table.id
  
}

resource "aws_route_table_association" "public-ap-northeast-1c" {
  subnet_id      = aws_subnet.CloudMaraduers-Aus-02.id
  route_table_id = aws_route_table.public_route_table.id
  
}

