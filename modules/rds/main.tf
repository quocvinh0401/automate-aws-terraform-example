resource "aws_security_group" "mysql-sg" {
  name = "mysql-sg"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysql-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_mysql" {
  security_group_id = aws_security_group.mysql-sg.id
  from_port         = 3306
  to_port           = 3306
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
}

resource "aws_db_instance" "this" {
  identifier             = var.identifier
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  vpc_security_group_ids = [aws_security_group.mysql-sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = true

  tags = {
    Name = var.db_name
  }
}