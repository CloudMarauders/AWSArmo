

resource "aws_route_table" "CA-private_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-CA-TMMC.id

  route {
    cidr_block                  = "0.0.0.0/0"
    nat_gateway_id              = aws_nat_gateway.CA-nat.id
  }
  
  
  
  
  
  
  tags = {
    Name = "CloudMaraduers-CA-Private-Route-Table"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
  
}


resource "aws_route_table" "CA-public_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-CA-TMMC.id

  route {
    cidr_block                  = "0.0.0.0/0"
    gateway_id                  = aws_internet_gateway.CA-igw.id
   
    
  }
  
  
  
  
  
  
  tags = {
    Name = "CloudMaraduers-CA-Public-Route-Table"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
  
}

################################################## Private Subnets
resource "aws_route_table_association" "private-us-west-1a" {
  subnet_id      = aws_subnet.CloudMaraduers-CA-11.id
  route_table_id = aws_route_table.CA-private_route_table.id
  
}

resource "aws_route_table_association" "private-us-west-1c" {
  subnet_id      = aws_subnet.CloudMaraduers-CA-12.id
  route_table_id = aws_route_table.CA-private_route_table.id
  
}



################################################## Public Subnets

resource "aws_route_table_association" "public-us-west-1a" {
  subnet_id      = aws_subnet.CloudMaraduers-CA-01.id
  route_table_id = aws_route_table.CA-public_route_table.id
  
}

resource "aws_route_table_association" "public-us-west-1c" {
  subnet_id      = aws_subnet.CloudMaraduers-CA-02.id
  route_table_id = aws_route_table.CA-public_route_table.id
  
}

