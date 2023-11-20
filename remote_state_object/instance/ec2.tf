provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0dbc3d7bc646e8516"
    instance_type = "t2.micro"
}

output "public_ip" {
    value = aws_instance.myec2.public_ip  
}