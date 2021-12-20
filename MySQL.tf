
# PROJECT6 RDS 
# aws_db_instance

resource "aws_db_instance" "RDS-Wimble6" {
  allocated_storage    = 12
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "Wimble6db"
  username             = "proWimble6"
  password             = "Dolly1990"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.Wimble6-db-group.name
}


# db_subnet group

resource "aws_db_subnet_group" "Wimble6-db-group" {
  name       = "wimble6-db1"
  subnet_ids = [aws_subnet.Private-Subnet1.id, aws_subnet.Private-Subnet2.id]

  tags = {
    Name = "My-DB-Pri-sub-group"
  }
}

# SECURITY GROUP FOR DATABASE instance

resource "aws_security_group" "Wimble6-db-secgrp" {
  name              = "Wimble6-db_sec-group"
  description       = "Allow mysql inbound traffic"
  vpc_id            = aws_vpc.Wimble6_vpc.id

}

resource "aws_security_group_rule" "Wimble6-inbound" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.Wimble6-db-secgrp.id
}

resource "aws_security_group_rule" "Wimble6-outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.Wimble6-db-secgrp.id
}