resource "aws_internet_gateway" "movie_igw" {
  vpc_id = aws_vpc.vpc_challenge.id

  tags = {
    Name = "VPC-Challenge-IGW"
  }
}

resource "aws_eip" "movie_allocation_ip" {
  vpc = true
}

resource "aws_nat_gateway" "movie_nat_gateway" {

  allocation_id     = aws_eip.movie_allocation_ip.id
  subnet_id         = data.aws_subnet.public1_subnet.id
  connectivity_type = "public"

  tags = {
    Name = "VPC-Challenge-Nat-Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.movie_igw]
}