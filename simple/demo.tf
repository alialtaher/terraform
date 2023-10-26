provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "ec2_terraform1" {
    ami = "ami-0dbc3d7bc646e8516"
    instance_type = "t2.micro"
}