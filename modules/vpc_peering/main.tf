# Create the VPC Peering Connection
resource "aws_vpc_peering_connection" "this" {
  provider              = aws.requester
  vpc_id                = var.requester_vpc_id
  peer_vpc_id           = var.accepter_vpc_id
  peer_region           = var.accepter_region
  auto_accept           = false

  tags = {
    Name = var.name
  }
}

# Accept the Peering Connection in the Accepter Region
resource "aws_vpc_peering_connection_accepter" "this" {
  provider = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id

  tags = {
    Name = var.name
  }
}

# Routes in the Requester's Route Table
resource "aws_route" "requester_to_peer" {
  for_each = toset(var.requester_subnet_route_table_ids)

  route_table_id         = each.value
  destination_cidr_block = var.accepter_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}

# Routes in the Accepter's Route Table
resource "aws_route" "peer_to_requester" {
  provider = aws.accepter

  for_each = toset(var.accepter_subnet_route_table_ids)

  route_table_id         = each.value
  destination_cidr_block = var.requester_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}