

resource "aws_route_table" "London-private_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-London-TMMC.id

  route {
    cidr_block                  = "0.0.0.0/0"
    nat_gateway_id              = aws_nat_gateway.London-nat.id
  }
  
  
  
  
  
  
  tags = {
    Name = "CloudMaraduers-London-Private-Route-Table"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
  
}


resource "aws_route_table" "London-public_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-London-TMMC.id

  route {
    cidr_block                  = "0.0.0.0/0"
    gateway_id                  = aws_internet_gateway.London-igw.id
   
    
  }
  
  
  
  
  
  
  tags = {
    Name = "CloudMaraduers-London-Public-Route-Table"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
  
}

################################################## Private Subnets
resource "aws_route_table_association" "private-eu-west-1a" {
  subnet_id      = aws_subnet.CloudMaraduers-London-11.id
  route_table_id = aws_route_table.London-private_route_table.id
  
}

resource "aws_route_table_association" "private-eu-west-1c" {
  subnet_id      = aws_subnet.CloudMaraduers-London-12.id
  route_table_id = aws_route_table.London-private_route_table.id
  
}



################################################## Public Subnets

resource "aws_route_table_association" "public-eu-west-1a" {
  subnet_id      = aws_subnet.CloudMaraduers-London-01.id
  route_table_id = aws_route_table.London-public_route_table.id
  
}

resource "aws_route_table_association" "public-eu-west-1c" {
  subnet_id      = aws_subnet.CloudMaraduers-London-02.id
  route_table_id = aws_route_table.London-public_route_table.id
  
}

