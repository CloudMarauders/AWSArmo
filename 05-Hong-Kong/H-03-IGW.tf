

resource "aws_internet_gateway" "HK-igw" {
    vpc_id = aws_vpc.CloudMaraduers-HK-TMMC.id

    tags = {
        Name  = "CloudMaraduers-HK-TMMC-IGW"
        Owner = "CloudMaraduers"
        ring  = "prod"
    }
  
}