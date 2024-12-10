

resource "aws_internet_gateway" "London-igw" {
    vpc_id = aws_vpc.CloudMaraduers-London-TMMC.id

    tags = {
        Name  = "CloudMaraduers-London-TMMC-IGW"
        Owner = "CloudMaraduers"
        ring  = "prod"
    }
  
}