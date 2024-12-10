

resource "aws_eip" "London-nat" {
    vpc = true
    tags = {
        Name = "nat"
    }
  
}


resource "aws_nat_gateway" "London-nat" {
    allocation_id = aws_eip.London-nat.id
    subnet_id = aws_subnet.CloudMaraduers-London-01.id
    tags = {
        Name = "nat"
    }
 depends_on = [ aws_internet_gateway.London-igw ]
 

}