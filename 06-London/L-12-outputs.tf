output "vpc_id" {
  value = aws_vpc.CloudMaraduers-London-TMMC.id
}

output "route_table_id" {
  value = [
  aws_route_table.London-private_route_table.id
  ]
}

output "cidr_block" {
  value = aws_vpc.CloudMaraduers-London-TMMC.cidr_block
}