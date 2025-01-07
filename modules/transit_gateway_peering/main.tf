resource "aws_ec2_transit_gateway_peering_attachment" "this" {
  provider                       = aws.requester
  transit_gateway_id             = var.requester_transit_gateway_id
  peer_transit_gateway_id        = var.accepter_transit_gateway_id
  peer_region                    = var.accepter_region

  tags = {
    Name = var.name
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "this" {
  provider = aws.accepter
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.this.id

  tags = {
    Name = var.name
  }
}