/*

resource "aws_db_instance" "cloudmaraduers_Aus_instance" {
  identifier                = "cloudmaraduers-Aus-instance"
  engine                    = "mysql"
  engine_version            = "8.0" 
  instance_class            = "db.t3.medium" 
  allocated_storage         = 20 
  storage_type              = "gp2" 
  multi_az                  = false 
  publicly_accessible       = false 
  vpc_security_group_ids    = [aws_security_group.db_sg.id] 
  db_subnet_group_name      = aws_db_subnet_group.cloudmaraduers_Aus_subnet_group.name
  username                  = "admin" 
  password                  = "securepassword123!" 
  skip_final_snapshot       = true 
  deletion_protection       = false 
  parameter_group_name      = "default.mysql8.0" 

  tags = {
    Name        = "CloudMaraduers-Aus-DB"
    Environment = "Production"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "cloudmaraduers-Aus-db-sg"
  description = "Security group for the CloudMaraduers Aus RDS instance"

  vpc_id = aws_vpc.CloudMaraduers-Aus-TMMC.id

  ingress {
    from_port   = 3306 
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.61.0.0/16"] 
  }


  tags = {
    Name = "CloudMaraduers-Aus-DB-SG"
  }
}

resource "aws_db_subnet_group" "cloudmaraduers_Aus_subnet_group" {
  name        = "cloudmaraduers-Aus-db-subnet-group"
  description = "DB Subnet group for CloudMaraduers Aus"

  subnet_ids = [
    aws_subnet.CloudMaraduers-Aus-12.id, aws_subnet.CloudMaraduers-Aus-13.id
  ]

  tags = {
    Name = "CloudMaraduers-Aus-DB-Subnet-Group"
  }
}

*/