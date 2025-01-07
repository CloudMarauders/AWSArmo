

resource "aws_route_table" "Sao-private_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-Sao-TMMC.id

  route {
    cidr_block                  = "0.0.0.0/0"
    nat_gateway_id              = aws_nat_gateway.Sao-nat.id
  }
  
  
  
  
  
  
  tags = {
    Name = "CloudMaraduers-Sao-Private-Route-Table"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
  
}


resource "aws_route_table" "Sao-public_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-Sao-TMMC.id

  route {
    cidr_block                  = "0.0.0.0/0"
    gateway_id                  = aws_internet_gateway.Sao-igw.id
   
    
  }
  
  
  
  
  
  
  tags = {
    Name = "CloudMaraduers-Sao-Public-Route-Table"
    Owner = "CloudMaraduers"
    ring = "prod"
  }
  
}

################################################## Private Subnets
resource "aws_route_table_association" "private-sa-east-1a" {
  subnet_id      = aws_subnet.CloudMaraduers-Sao-11.id
  route_table_id = aws_route_table.Sao-private_route_table.id
  
}

resource "aws_route_table_association" "private-sa-east-1c" {
  subnet_id      = aws_subnet.CloudMaraduers-Sao-12.id
  route_table_id = aws_route_table.Sao-private_route_table.id
  
}



################################################## Public Subnets

resource "aws_route_table_association" "public-sa-east-1a" {
  subnet_id      = aws_subnet.CloudMaraduers-Sao-01.id
  route_table_id = aws_route_table.Sao-public_route_table.id
  
}

resource "aws_route_table_association" "public-sa-east-1c" {
  subnet_id      = aws_subnet.CloudMaraduers-Sao-02.id
  route_table_id = aws_route_table.Sao-public_route_table.id
  
}

