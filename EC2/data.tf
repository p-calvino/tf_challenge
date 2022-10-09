data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "public_subnet_a" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_1_name]
  }
}

data "aws_subnet" "public_subnet_b" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_2_name]
  }
}

data "aws_subnet" "public_subnet_c" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_3_name]
  }
}

data "aws_subnet" "private_subnet_a" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_1_name]
  }
}

data "aws_subnet" "private_subnet_b" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_2_name]
  }
}

data "aws_subnet" "private_subnet_c" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_3_name]
  }
}

data "aws_ami" "amz_linux_image" {
  most_recent = true
  owners      = [var.amzn_ami_owner]

  filter {
    name   = "name"
    values = [var.amzn_ami_name]
  }
}

data "aws_security_group" "sg_bastion" {
  filter {
    name   = "tag:Name"
    values = ["Public-Bastion"]
  }
}

data "aws_security_group" "sg_app" {
  filter {
    name   = "tag:Name"
    values = ["Private-SG-App"]
  }
}