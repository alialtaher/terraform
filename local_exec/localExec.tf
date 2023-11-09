provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "instance1" {
    ami = "ami-05c13eab67c5d8861"
    instance_type = "t2.micro"
    provisioner "local-exec" {
        command = "echo ${aws_instance.instance1.private_ip} >> ./ip.txt"
    }
}