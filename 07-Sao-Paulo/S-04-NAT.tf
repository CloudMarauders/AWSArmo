

resource "aws_eip" "Sao-nat" {
    vpc = true
    tags = {
        Name = "nat"
    }
  
}


resource "aws_nat_gateway" "Sao-nat" {
    allocation_id = aws_eip.Sao-nat.id
    subnet_id = aws_subnet.CloudMaraduers-Sao-01.id
    tags = {
        Name = "nat"
    }
 depends_on = [ aws_internet_gateway.Sao-igw ]
 

}