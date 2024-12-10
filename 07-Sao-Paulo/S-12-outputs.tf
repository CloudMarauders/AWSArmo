output "vpc_id" {
  value = aws_vpc.CloudMaraduers-Sao-TMMC.id
}

output "route_table_id" {
  value = [
  aws_route_table.Sao-private_route_table.id
  ]
}

output "cidr_block" {
  value = aws_vpc.CloudMaraduers-Sao-TMMC.cidr_block
}