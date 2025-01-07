

resource "aws_internet_gateway" "Sao-igw" {
    vpc_id = aws_vpc.CloudMaraduers-Sao-TMMC.id

    tags = {
        Name  = "CloudMaraduers-Sao-TMMC-IGW"
        Owner = "CloudMaraduers"
        ring  = "prod"
    }
  
}