output "vpc_id" {
  value = aws_vpc.CloudMaraduers-CA-TMMC.id
}

output "private_subnet_id" {
  value = aws_subnet.CloudMaraduers-CA-11.id
  
}