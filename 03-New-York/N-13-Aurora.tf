resource "aws_db_instance" "cloudmaraduers_ny_instance" {
  identifier                = "cloudmaraduers-ny-instance"
  engine                    = "mysql"
  engine_version            = "8.0" 
  instance_class            = "db.t3.medium" 
  allocated_storage         = 20 
  storage_type              = "gp2" 
  multi_az                  = false 
  publicly_accessible       = false 
  vpc_security_group_ids    = [aws_security_group.db_sg.id] 
  db_subnet_group_name      = aws_db_subnet_group.cloudmaraduers_ny_subnet_group.name
  username                  = "admin" 
  password                  = "securepassword123!" 
  skip_final_snapshot       = true 
  deletion_protection       = false 
  parameter_group_name      = "default.mysql8.0" 

  tags = {
    Name        = "CloudMaraduers-NY-DB"
    Environment = "Production"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "cloudmaraduers-ny-db-sg"
  description = "Security group for the CloudMaraduers NY RDS instance"

  vpc_id = aws_vpc.CloudMaraduers-NY-TMMC.id

  ingress {
    from_port   = 3306 
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.42.0.0/16"] 
  }
/*
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }
*/
  tags = {
    Name = "CloudMaraduers-NY-DB-SG"
  }
}

resource "aws_db_subnet_group" "cloudmaraduers_ny_subnet_group" {
  name        = "cloudmaraduers-ny-db-subnet-group"
  description = "DB Subnet group for CloudMaraduers NY"

  subnet_ids = [
    aws_subnet.CloudMaraduers-NY-12.id, aws_subnet.CloudMaraduers-NY-13.id
  ]

  tags = {
    Name = "CloudMaraduers-NY-DB-Subnet-Group"
  }
}