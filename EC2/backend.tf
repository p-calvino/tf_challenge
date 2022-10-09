terraform {
  backend "s3" {
    bucket         = "ta-terraform-tfstates-407372460187"
    key            = "projects/tf-challenge/ec2/terraform.tfstates"
    dynamodb_table = "terraform-lock"
    region         = "eu-central-1"
  }
}