

resource "aws_eip" "CA-nat" {
    vpc = true
    tags = {
        Name = "nat"
    }
  
}


resource "aws_nat_gateway" "CA-nat" {
    allocation_id = aws_eip.CA-nat.id
    subnet_id = aws_subnet.CloudMaraduers-CA-01.id
    tags = {
        Name = "nat"
    }
 depends_on = [ aws_internet_gateway.CA-igw ]
 

}