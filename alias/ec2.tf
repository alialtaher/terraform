resource "aws_instance" "active" {
    ami = "ami-0dbc3d7bc646e8516"
    instance_type = "t2.micro"
    provider = aws.active
  
}
resource "aws_instance" "standby" {
    ami = "ami-0dbc3d7bc646e8516"
    instance_type = "t2.micro"
    provider = aws.standby
  
}