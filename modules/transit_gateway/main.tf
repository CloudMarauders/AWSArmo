# Tokyo Transit Gateway
resource "aws_ec2_transit_gateway" "tokyo" {
  provider    = aws.tokyo
  description = "Central Transit Gateway in Tokyo for Syslog Traffic"

  tags = {
    Name = "Tokyo-Transit-Gateway"
  }
}

resource "aws_ec2_transit_gateway_route_table" "tokyo_route_table" {
  provider            = aws.tokyo
  transit_gateway_id  = aws_ec2_transit_gateway.tokyo.id

  tags = {
    Name = "Tokyo-Route-Table"
  }
}

# California Transit Gateway
resource "aws_ec2_transit_gateway" "california" {
  provider    = aws.california
  description = "Regional Transit Gateway in California"

  tags = {
    Name = "California-Transit-Gateway"
  }
}

resource "aws_ec2_transit_gateway_route_table" "california_route_table" {
  provider            = aws.california
  transit_gateway_id  = aws_ec2_transit_gateway.california.id

  tags = {
    Name = "California-Route-Table"
  }
}

# New York Transit Gateway
resource "aws_ec2_transit_gateway" "newyork" {
  provider    = aws.newyork
  description = "Regional Transit Gateway in New York"

  tags = {
    Name = "NewYork-Transit-Gateway"
  }
}

resource "aws_ec2_transit_gateway_route_table" "newyork_route_table" {
  provider            = aws.newyork
  transit_gateway_id  = aws_ec2_transit_gateway.newyork.id

  tags = {
    Name = "NewYork-Route-Table"
  }
}

# Australia Transit Gateway
resource "aws_ec2_transit_gateway" "aus" {
  provider    = aws.australia
  description = "Regional Transit Gateway in Australia"

  tags = {
    Name = "Australia-Transit-Gateway"
  }
}

resource "aws_ec2_transit_gateway_route_table" "aus_route_table" {
  provider            = aws.australia
  transit_gateway_id  = aws_ec2_transit_gateway.aus.id

  tags = {
    Name = "Australia-Route-Table"
  }
}

# Hong Kong Transit Gateway
resource "aws_ec2_transit_gateway" "hongkong" {
  provider    = aws.hongkong
  description = "Regional Transit Gateway in Hong Kong"

  tags = {
    Name = "HongKong-Transit-Gateway"
  }
}

resource "aws_ec2_transit_gateway_route_table" "hongkong_route_table" {
  provider            = aws.hongkong
  transit_gateway_id  = aws_ec2_transit_gateway.hongkong.id

  tags = {
    Name = "HongKong-Route-Table"
  }
}

# London Transit Gateway
resource "aws_ec2_transit_gateway" "london" {
  provider    = aws.london
  description = "Regional Transit Gateway in London"

  tags = {
    Name = "London-Transit-Gateway"
  }
}

resource "aws_ec2_transit_gateway_route_table" "london_route_table" {
  provider            = aws.london
  transit_gateway_id  = aws_ec2_transit_gateway.london.id

  tags = {
    Name = "London-Route-Table"
  }
}

# Sao Paulo Transit Gateway
resource "aws_ec2_transit_gateway" "saopaulo" {
  provider    = aws.saopaulo
  description = "Regional Transit Gateway in Sao Paulo"

  tags = {
    Name = "SaoPaulo-Transit-Gateway"
  }
}

resource "aws_ec2_transit_gateway_route_table" "saopaulo_route_table" {
  provider            = aws.saopaulo
  transit_gateway_id  = aws_ec2_transit_gateway.saopaulo.id

  tags = {
    Name = "SaoPaulo-Route-Table"
  }
}