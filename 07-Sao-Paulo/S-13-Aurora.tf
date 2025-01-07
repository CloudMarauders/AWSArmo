/*

resource "aws_db_instance" "cloudmaraduers_Sao_instance" {
  identifier                = "cloudmaraduers-Sao-instance"
  engine                    = "mysql"
  engine_version            = "8.0" 
  instance_class            = "db.t3.medium" 
  allocated_storage         = 20 
  storage_type              = "gp2" 
  multi_az                  = false 
  publicly_accessible       = false 
  vpc_security_group_ids    = [aws_security_group.db_sg.id] 
  db_subnet_group_name      = aws_db_subnet_group.cloudmaraduers_Sao_subnet_group.name
  username                  = "admin" 
  password                  = "securepassword123!" 
  skip_final_snapshot       = true 
  deletion_protection       = false 
  parameter_group_name      = "default.mysql8.0" 

  tags = {
    Name        = "CloudMaraduers-Sao-DB"
    Environment = "Production"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "cloudmaraduers-Sao-db-sg"
  description = "Security group for the CloudMaraduers Sao RDS instance"

  vpc_id = aws_vpc.CloudMaraduers-Sao-TMMC.id

  ingress {
    from_port   = 3306 
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.55.0.0/16"] 
  }


  tags = {
    Name = "CloudMaraduers-Sao-DB-SG"
  }
}

resource "aws_db_subnet_group" "cloudmaraduers_Sao_subnet_group" {
  name        = "cloudmaraduers-Sao-db-subnet-group"
  description = "DB Subnet group for CloudMaraduers Sao"

  subnet_ids = [
    aws_subnet.CloudMaraduers-Sao-12.id, aws_subnet.CloudMaraduers-Sao-13.id
  ]

  tags = {
    Name = "CloudMaraduers-Sao-DB-Subnet-Group"
  }
}

*/