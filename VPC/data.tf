data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_subnet" "public1_subnet" {
  depends_on = [aws_subnet.movie_public_subnets]

  filter {
    name   = "tag:Name"
    values = ["Public-1"]
  }
}

data "aws_subnet" "public2_subnet" {
  depends_on = [aws_subnet.movie_public_subnets]

  filter {
    name   = "tag:Name"
    values = ["Public-2"]
  }
}

data "aws_subnet" "public3_subnet" {
  depends_on = [aws_subnet.movie_public_subnets]

  filter {
    name   = "tag:Name"
    values = ["Public-3"]
  }
}

data "aws_subnet" "private1_subnet" {
  depends_on = [aws_subnet.movie_private_subnets]

  filter {
    name   = "tag:Name"
    values = ["Private-1"]
  }
}

data "aws_subnet" "private2_subnet" {
  depends_on = [aws_subnet.movie_private_subnets]

  filter {
    name   = "tag:Name"
    values = ["Private-2"]
  }
}

data "aws_subnet" "private3_subnet" {
  depends_on = [aws_subnet.movie_private_subnets]

  filter {
    name   = "tag:Name"
    values = ["Private-3"]
  }
}

# data "aws_route_table" "public1_rt" {

#   filter {
#     name   = "tag:Name"
#     values = ["Movie-Public-RT-1"]
#   }
#   depends_on = [aws_route_table.movie_public_route_tables_1]
# }

# data "aws_route_table" "public2_rt" {
#   filter {
#     name   = "tag:Name"
#     values = ["Movie-Public-RT-2"]
#   }
# }

# data "aws_route_table" "public3_rt" {
#   filter {
#     name   = "tag:Name"
#     values = ["Movie-Public-RT-3"]
#   }
# }


