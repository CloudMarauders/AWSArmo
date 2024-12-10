output "vpc_peering_connection_id" {
  value = aws_vpc_peering_connection.this.id
}

output "requester_routes" {
  value = [for key, route in aws_route.requester_to_peer : route.id]
}

output "accepter_routes" {
  value = [for key, route in aws_route.peer_to_requester : route.id]
}