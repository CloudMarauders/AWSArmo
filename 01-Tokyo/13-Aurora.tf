/*

resource "aws_db_instance" "cloudmaraduers_Toyko_instance" {
  identifier                = "cloudmaraduers-Toyko-instance"
  engine                    = "mysql"
  engine_version            = "8.0" 
  instance_class            = "db.t3.medium" 
  allocated_storage         = 20 
  storage_type              = "gp2" 
  multi_az                  = false 
  publicly_accessible       = false 
  vpc_security_group_ids    = [aws_security_group.db_sg.id] 
  db_subnet_group_name      = aws_db_subnet_group.cloudmaraduers_Toyko_subnet_group.name
  username                  = "admin" 
  password                  = "securepassword123!" 
  skip_final_snapshot       = true 
  deletion_protection       = false 
  parameter_group_name      = "default.mysql8.0" 

  tags = {
    Name        = "CloudMaraduers-Toyko-DB"
    Environment = "Production"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "cloudmaraduers-Toyko-db-sg"
  description = "Security group for the CloudMaraduers Toyko RDS instance"

  vpc_id = aws_vpc.CloudMaraduers-Toyko-TMMC.id

  ingress {
    from_port   = 3306 
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.16.0.0/16"] 
  }


  tags = {
    Name = "CloudMaraduers-Toyko-DB-SG"
  }
}

resource "aws_db_subnet_group" "cloudmaraduers_Toyko_subnet_group" {
  name        = "cloudmaraduers-Toyko-db-subnet-group"
  description = "DB Subnet group for CloudMaraduers Toyko"

  subnet_ids = [
    aws_subnet.CloudMaraduers-Toyko-12.id, aws_subnet.CloudMaraduers-Toyko-13.id
  ]

  tags = {
    Name = "CloudMaraduers-Toyko-DB-Subnet-Group"
  }
}

*/