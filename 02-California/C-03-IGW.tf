

resource "aws_internet_gateway" "CA-igw" {
    vpc_id = aws_vpc.CloudMaraduers-CA-TMMC.id

    tags = {
        Name  = "CloudMaraduers-CA-TMMC-IGW"
        Owner = "CloudMaraduers"
        ring  = "prod"
    }
  
}