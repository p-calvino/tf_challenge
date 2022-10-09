resource "aws_instance" "bastion_instance" {
  ami                    = data.aws_ami.amz_linux_image.id
  instance_type          = var.movie_app_ec2_type
  subnet_id              = data.aws_subnet.public_subnet_a.id
  vpc_security_group_ids = [data.aws_security_group.sg_bastion.id]
  key_name               = var.keypair_name
  #   user_data = "${path.module}/user-data.sh"

  tags = {
    Name = "Challenge-Bastion"
  }
}

resource "aws_instance" "app_instance_1" {
  ami                    = data.aws_ami.amz_linux_image.id
  instance_type          = var.movie_app_ec2_type
  subnet_id              = data.aws_subnet.private_subnet_a.id
  vpc_security_group_ids = [data.aws_security_group.sg_app.id]
  key_name               = var.keypair_name
  #   user_data = "${path.module}/user-data.sh"

  tags = {
    Name = "App-Instance-1"
  }
}

resource "aws_instance" "app_instance_2" {
  ami                    = data.aws_ami.amz_linux_image.id
  instance_type          = var.movie_app_ec2_type
  subnet_id              = data.aws_subnet.private_subnet_a.id
  vpc_security_group_ids = [data.aws_security_group.sg_app.id]
  key_name               = var.keypair_name
  #   user_data = "${path.module}/user-data.sh"

  tags = {
    Name = "App-Instance-2"
  }
}

resource "aws_instance" "app_instance_3" {
  ami                    = data.aws_ami.amz_linux_image.id
  instance_type          = var.movie_app_ec2_type
  subnet_id              = data.aws_subnet.private_subnet_a.id
  vpc_security_group_ids = [data.aws_security_group.sg_app.id]
  key_name               = var.keypair_name
  #   user_data = "${path.module}/user-data.sh"

  tags = {
    Name = "App-Instance-3"
  }
}