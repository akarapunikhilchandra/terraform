resource "aws_key_pair" "deployer" {
  key_name   = "ansible.pub"
  public_key = file("${path.module}/ansible.pub")
}

resource "aws_instance" "mykey" {
  ami = var.ami_id
  instance_type = "t2.micro"
  key_name = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.port22.name]
}
resource "aws_security_group" "port22" {
  name        = "port22"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "allowing port 22"
    from_port        = 22
    to_port          = 22
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
    Name = "allow_ssh"
  }
}
