terraform destroy allows us to destroy all the resource that are created within the folder.

terraform destroy with -target flag allows us to destroy specific resource.

Example: 
if I have the following resource 

resource "aws_instance" "ec2_terraform1" {
    ami = "ami-0dbc3d7bc646e8516"
    instance_type = "t2.micro"
    tags = {
      "Name" = "ec2_terraform1"
    }
}

resource "aws_instance" "ec2_terraform2" {
    ami = "ami-0dbc3d7bc646e8516"
    instance_type = "t2.micro"
    tags = {
      "Name" = "ec2_terraform2"
    }
}

resource "aws_instance" "ec2_terraform3" {
    ami = "ami-0dbc3d7bc646e8516"
    instance_type = "t2.micro"
    tags = {
      "Name" = "ec2_terraform3"
    }
}

if I want to destroy ec2_terraform3 only, I have to access it using this combination: resource_type.Resource_name

terraform destroy -target aws_instance.ec2_terraform3

Noting that this combination should be unique across the whole module!!!


