resource "aws_subnet" "movie_public_subnets" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.vpc_challenge.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-${count.index + 1}"
  }
}

resource "aws_subnet" "movie_private_subnets" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.vpc_challenge.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "Private-${count.index + 1}"
  }
}