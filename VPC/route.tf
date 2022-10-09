# resource "aws_route" "default_route" {
#   route_table_id = aws_route_table.movie_public_route_table.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.movie_igw.id

# }

resource "aws_route_table" "movie_public_route_table" {
  vpc_id = aws_vpc.vpc_challenge.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.movie_igw.id

  }

  tags = {
    Name = "Challenge-Public-RT"
  }
}

resource "aws_route_table" "movie_private_route_table" {
  vpc_id = aws_vpc.vpc_challenge.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.movie_nat_gateway.id

  }


  tags = {
    Name = "Challenge-Private-RT"
  }
}

resource "aws_route_table_association" "movie_public_1_rt_assoc" {
  subnet_id      = data.aws_subnet.public1_subnet.id
  route_table_id = aws_route_table.movie_public_route_table.id
}
resource "aws_route_table_association" "movie_public_2_rt_assoc" {
  subnet_id      = data.aws_subnet.public2_subnet.id
  route_table_id = aws_route_table.movie_public_route_table.id
}
resource "aws_route_table_association" "movie_public_3_rt_assoc" {
  subnet_id      = data.aws_subnet.public3_subnet.id
  route_table_id = aws_route_table.movie_public_route_table.id
}

resource "aws_route_table_association" "movie_private_1_rt_assoc" {
  subnet_id      = data.aws_subnet.private1_subnet.id
  route_table_id = aws_route_table.movie_private_route_table.id
}
resource "aws_route_table_association" "movie_private_2_rt_assoc" {
  subnet_id      = data.aws_subnet.private2_subnet.id
  route_table_id = aws_route_table.movie_private_route_table.id
}
resource "aws_route_table_association" "movie_private_3_rt_assoc" {
  subnet_id      = data.aws_subnet.private3_subnet.id
  route_table_id = aws_route_table.movie_private_route_table.id
}
