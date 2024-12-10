

resource "aws_eip" "NY-nat" {
    vpc = true
    tags = {
        Name = "nat"
    }
  
}


resource "aws_nat_gateway" "NY-nat" {
    allocation_id = aws_eip.NY-nat.id
    subnet_id = aws_subnet.CloudMaraduers-NY-01.id
    tags = {
        Name = "nat"
    }
 depends_on = [ aws_internet_gateway.NY-igw ]
 

}