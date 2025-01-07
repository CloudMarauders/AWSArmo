

resource "aws_internet_gateway" "Tokyo-igw" {
    vpc_id = aws_vpc.CloudMaraduers-Tokyo-TMMC.id

    tags = {
        Name  = "CloudMaraduers-Tokyo-TMMC-IGW"
        Owner = "CloudMaraduers"
        ring  = "prod"
    }
  
}