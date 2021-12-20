
# Main VPC Wimble6

resource "aws_vpc" "Wimble6_vpc" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = "default"

  tags = {
    Name = var.tag-post
  }
}

# Public Subnet 1


resource "aws_subnet" "Public-Subnet1" {
  vpc_id     = aws_vpc.Wimble6_vpc.id
  cidr_block = var.Public-Subnet1
  availability_zone = "eu-west-3a"

  tags = {
    Name = "Public-Subnet1"
  }
}



# Public Subnet 2


resource "aws_subnet" "Public-Subnet2" {
  vpc_id     = aws_vpc.Wimble6_vpc.id
  cidr_block = var.Public-Subnet2
  availability_zone = "eu-west-3b"

  tags = {
    Name = "Public-Subnet2"
  }
}

# Private Subnet-1


resource "aws_subnet" "Private-Subnet1" {
  vpc_id     = aws_vpc.Wimble6_vpc.id
  cidr_block = var.Private-Subnet1
  availability_zone = "eu-west-3c"

  tags = {
    Name = "Private-Subnet1"
  }
}


# Private Subnet-2


resource "aws_subnet" "Private-Subnet2" {
  vpc_id     = aws_vpc.Wimble6_vpc.id
  cidr_block = var.Private-Subnet2
  availability_zone = "eu-west-3b"


  tags = {
    Name = "Private-Subnet2"
  }
}


# Public Route Table-1

resource "aws_route_table" "Pub-Routetable-1" {
  vpc_id = aws_vpc.Wimble6_vpc.id

  

  tags = {
    Name = "Pub-Routetable-1"
  }
}




# Private Route Table-1

resource "aws_route_table" "Pri-Routetable-1" {
  vpc_id = aws_vpc.Wimble6_vpc.id

  

  tags = {
    Name = "Pri-Routetable-1"
  }
}




# Public Subnet Association  with Public Route-Table1

resource "aws_route_table_association" "Pub-RTA1" {
  subnet_id      = aws_subnet.Public-Subnet1.id
  route_table_id = aws_route_table.Pub-Routetable-1.id
}  
  

# Public Subnet Association with Public Route-Table2

resource "aws_route_table_association" "Pub-RTA2" {
  subnet_id      = aws_subnet.Public-Subnet2.id
  route_table_id = aws_route_table.Pub-Routetable-1.id
}  



# Private Subnet Association with Public Route-Table1

resource "aws_route_table_association" "Pri-RTA1" {
  subnet_id      = aws_subnet.Private-Subnet1.id
  route_table_id = aws_route_table.Pri-Routetable-1.id
}  

  

# Internet-Gateway

resource "aws_internet_gateway" "Wimble6_IGW" {
  vpc_id = aws_vpc.Wimble6_vpc.id

  tags = {
    Name = "Wimble6_IGW"
  }
}


# Internet Gateway Association with Route-Table

resource "aws_route" "Wimble6-IGW-RT" {
  route_table_id            = aws_route_table.Pub-Routetable-1.id
  destination_cidr_block    = "0.0.0.0/0"



 gateway_id                 =     aws_internet_gateway.Wimble6_IGW.id
}
















