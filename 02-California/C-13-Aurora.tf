/*

resource "aws_db_instance" "cloudmaraduers_CA_instance" {
  identifier                = "cloudmaraduers-CA-instance"
  engine                    = "mysql"
  engine_version            = "8.0" 
  instance_class            = "db.t3.medium" 
  allocated_storage         = 20 
  storage_type              = "gp2" 
  multi_az                  = false 
  publicly_accessible       = false 
  vpc_security_group_ids    = [aws_security_group.db_sg.id] 
  db_subnet_group_name      = aws_db_subnet_group.cloudmaraduers_CA_subnet_group.name
  username                  = "admin" 
  password                  = "securepassword123!" 
  skip_final_snapshot       = true 
  deletion_protection       = false 
  parameter_group_name      = "default.mysql8.0" 

  tags = {
    Name        = "CloudMaraduers-CA-DB"
    Environment = "Production"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "cloudmaraduers-CA-db-sg"
  description = "Security group for the CloudMaraduers CA RDS instance"

  vpc_id = aws_vpc.CloudMaraduers-CA-TMMC.id

  ingress {
    from_port   = 3306 
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.8.0.0/16"] 
  }


  tags = {
    Name = "CloudMaraduers-CA-DB-SG"
  }
}

resource "aws_db_subnet_group" "cloudmaraduers_CA_subnet_group" {
  name        = "cloudmaraduers-CA-db-subnet-group"
  description = "DB Subnet group for CloudMaraduers CA"

  subnet_ids = [
    aws_subnet.CloudMaraduers-CA-12.id, aws_subnet.CloudMaraduers-CA-13.id
  ]

  tags = {
    Name = "CloudMaraduers-CA-DB-Subnet-Group"
  }
}

*/