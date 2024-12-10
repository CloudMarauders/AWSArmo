output "vpc_id" {
  value = aws_vpc.CloudMaraduers-Tokyo-TMMC.id
}

output "route_table_id" {
  value = [
  aws_route_table.Tokyo-private_route_table.id,
  ]
}

output "cidr_block" {
  value = aws_vpc.CloudMaraduers-Tokyo-TMMC.cidr_block
}