provider "aws" {
  region = "us-east-1"
  access_key = "" ##Senstive content, can be removed, aws configure is a better option
  secret_key = "" ##Senstive content, can be removed, aws configure is a better option
}

resource "aws_instance" "ec2_terraform1" {
    ami = "ami-0dbc3d7bc646e8516"
    instance_type = "t2.micro"
    tags = {
      "Name" = "ec2_terraform1"
    }
}