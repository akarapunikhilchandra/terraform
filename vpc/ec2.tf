resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "roboshop-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id 
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "roboshop-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.2.0/24" 
  tags = {
    Name = "roboshop-private-subnet"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "roboshop-internet-gateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id 
  }
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "allow" {
  name        = "allow"
  description = "allow 80 and 22"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "HTTP from internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-security-group"
  }
}

resource "aws_instance" "web" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id 
  vpc_security_group_ids = [aws_security_group.allow.id]
  associate_public_ip_address = true

  tags = {
    Name = "web"
  }
}
