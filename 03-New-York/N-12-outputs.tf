output "vpc_id" {
  value = aws_vpc.CloudMaraduers-NY-TMMC.id
}

output "route_table_id" {
  value = [
    aws_route_table.NY-private_route_table.id,
    
  ]
}

output "cidr_block" {
  value = aws_vpc.CloudMaraduers-NY-TMMC.cidr_block
}