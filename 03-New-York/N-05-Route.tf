

resource "aws_route_table" "NY-private_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-NY-TMMC.id

  route {
    cidr_block                  = "0.0.0.0/0"
    nat_gateway_id              = aws_nat_gateway.NY-nat.id
  }
  
  
  
  
  
  
  tags = {
    Name = "CloudMaraduers-NY-Private-Route-Table"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
  
}


resource "aws_route_table" "NY-public_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-NY-TMMC.id

  route {
    cidr_block                  = "0.0.0.0/0"
    gateway_id                  = aws_internet_gateway.NY-igw.id
   
    
  }
  
  
  
  
  
  
  tags = {
    Name = "CloudMaraduers-New York-Public-Route-Table"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
  
}

################################################## Private Subnets
resource "aws_route_table_association" "private-us-east-1a" {
  subnet_id      = aws_subnet.CloudMaraduers-NY-11.id
  route_table_id = aws_route_table.NY-private_route_table.id
  
}

resource "aws_route_table_association" "private-us-east-1b" {
  subnet_id      = aws_subnet.CloudMaraduers-NY-12.id
  route_table_id = aws_route_table.NY-private_route_table.id
  
}



################################################## Public Subnets

resource "aws_route_table_association" "public-us-east-1a" {
  subnet_id      = aws_subnet.CloudMaraduers-NY-01.id
  route_table_id = aws_route_table.NY-public_route_table.id
  
}

resource "aws_route_table_association" "public-us-east-1d" {
  subnet_id      = aws_subnet.CloudMaraduers-NY-02.id
  route_table_id = aws_route_table.NY-public_route_table.id
  
}

