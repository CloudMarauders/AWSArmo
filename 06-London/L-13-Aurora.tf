/*

resource "aws_db_instance" "cloudmaraduers_London_instance" {
  identifier                = "cloudmaraduers-London-instance"
  engine                    = "mysql"
  engine_version            = "8.0" 
  instance_class            = "db.t3.medium" 
  allocated_storage         = 20 
  storage_type              = "gp2" 
  multi_az                  = false 
  publicly_accessible       = false 
  vpc_security_group_ids    = [aws_security_group.db_sg.id] 
  db_subnet_group_name      = aws_db_subnet_group.cloudmaraduers_London_subnet_group.name
  username                  = "admin" 
  password                  = "securepassword123!" 
  skip_final_snapshot       = true 
  deletion_protection       = false 
  parameter_group_name      = "default.mysql8.0" 

  tags = {
    Name        = "CloudMaraduers-London-DB"
    Environment = "Production"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "cloudmaraduers-London-db-sg"
  description = "Security group for the CloudMaraduers London RDS instance"

  vpc_id = aws_vpc.CloudMaraduers-London-TMMC.id

  ingress {
    from_port   = 3306 
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.44.0.0/16"] 
  }


  tags = {
    Name = "CloudMaraduers-London-DB-SG"
  }
}

resource "aws_db_subnet_group" "cloudmaraduers_London_subnet_group" {
  name        = "cloudmaraduers-London-db-subnet-group"
  description = "DB Subnet group for CloudMaraduers London"

  subnet_ids = [
    aws_subnet.CloudMaraduers-London-12.id, aws_subnet.CloudMaraduers-London-13.id
  ]

  tags = {
    Name = "CloudMaraduers-London-DB-Subnet-Group"
  }
}

*/