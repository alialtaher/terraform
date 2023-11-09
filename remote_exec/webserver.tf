provider "aws" {
    region = "us-east-1"
}
resource "aws_security_group" "webserver_security_group" {
  name = "webserver_secgrp"
  ingress  {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
  }
  }
  resource "aws_security_group" "ssh_security_group" {
  name = "ssh_secgrp"
  ingress  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  }
resource "aws_instance" "webserver" {
    ami = "ami-05c13eab67c5d8861"
    instance_type = "t2.micro"
    key_name = "webserver"
    vpc_security_group_ids = [aws_security_group.webserver_security_group.id,aws_security_group.ssh_security_group.id]
    connection {
      type = "ssh"
      private_key = file("./webserver.pem")
      user = "ec2-user"
      host = self.public_ip
    }
    provisioner "remote-exec" {
        inline = [ 
            "sudo yum install -y nginx",
            "sudo systemctl start nginx",
            "sudo systemctl enable nginx"
         ]
      
    }
}