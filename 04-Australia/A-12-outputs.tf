output "vpc_id" {
  value = aws_vpc.CloudMaraduers-Aus-TMMC.id
}

output "route_table_id" {
  value = [
      
      aws_route_table.private_route_table.id
  ]
}

output "cidr_block" {
  value = aws_vpc.CloudMaraduers-Aus-TMMC.cidr_block
}