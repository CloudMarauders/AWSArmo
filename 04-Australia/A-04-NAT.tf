

resource "aws_eip" "Aus-nat" {
    vpc = true
    tags = {
        Name = "nat"
    }
  
}


resource "aws_nat_gateway" "Aus-nat" {
    allocation_id = aws_eip.Aus-nat.id
    subnet_id = aws_subnet.CloudMaraduers-Aus-01.id
    tags = {
        Name = "nat"
    }
 depends_on = [ aws_internet_gateway.Aus-igw ]
 

}