

resource "aws_eip" "HK-nat" {
    vpc = true
    tags = {
        Name = "nat"
    }
  
}


resource "aws_nat_gateway" "HK-nat" {
    allocation_id = aws_eip.HK-nat.id
    subnet_id = aws_subnet.CloudMaraduers-HK-01.id
    tags = {
        Name = "nat"
    }
 depends_on = [ aws_internet_gateway.HK-igw ]
 

}