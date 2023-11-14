module "ec2_instance" {
    source = "terraform-aws-modules/ec2_instance/aws"
    version = "2.13.0"
    name = "cluster"
    ami = "ami12345"
    instance_type = "t2.micro" 
    subnet_id = "subnet1234"

}