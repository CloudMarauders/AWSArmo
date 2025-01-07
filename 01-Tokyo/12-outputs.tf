output "vpc_id" {
  value = aws_vpc.CloudMaraduers-Tokyo-TMMC.id
}

output "private_subnet_id" {
  value = aws_subnet.CloudMaraduers-Tokyo-11.id
}