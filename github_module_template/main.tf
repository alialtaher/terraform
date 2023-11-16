provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "instanceX" {
    ami= "1234"
    instance_type = "t2.micro"
}
