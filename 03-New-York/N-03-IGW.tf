

resource "aws_internet_gateway" "NY-igw" {
    vpc_id = aws_vpc.CloudMaraduers-NY-TMMC.id

    tags = {
        Name  = "CloudMaraduers-NY-TMMC-IGW"
        Owner = "CloudMaraduers"
        ring  = "prod"
    }
  
}