output "vpc_id" {
  value = aws_vpc.CloudMaraduers-London-TMMC.id
}

output "private_subnet_id" {
  value = aws_subnet.CloudMaraduers-London-11.id
  
}