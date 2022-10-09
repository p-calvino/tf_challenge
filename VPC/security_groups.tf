resource "aws_security_group" "public_bastion" {
  name        = "Public-Bastion"
  description = "SG for bastion instance"
  vpc_id      = aws_vpc.vpc_challenge.id

  ingress {
    description = "SSH connection into the server"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP connection into the server"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public-Bastion"
  }
}

resource "aws_security_group" "private_app_sg" {
  name        = "Private-SG-App"
  description = "Allow access only from the Bastion Instance"
  vpc_id      = aws_vpc.vpc_challenge.id

  # INBOUND CONNECTIONS
  ingress {
    description     = "Allow SSH connection from Bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_bastion.id]
  }

  # OUTBOUT CONNECTIONS
  egress {
    description = "Allow access to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Private-SG-App"
  }
}