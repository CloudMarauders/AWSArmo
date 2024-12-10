output "vpc_id" {
  value = aws_vpc.CloudMaraduers-CA-TMMC.id
}

output "route_table_id" {
  value = [
    
    aws_route_table.CA-private_route_table.id
  ]
}

output "cidr_block" {
  value = aws_vpc.CloudMaraduers-CA-TMMC.cidr_block
}