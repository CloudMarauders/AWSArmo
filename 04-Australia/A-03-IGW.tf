

resource "aws_internet_gateway" "Aus-igw" {
    vpc_id = aws_vpc.CloudMaraduers-Aus-TMMC.id

    tags = {
        Name  = "CloudMaraduers-Aus-TMMC-IGW"
        Owner = "CloudMaraduers"
        ring  = "prod"
    }
  
}