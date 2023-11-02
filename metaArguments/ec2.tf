provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "NewEc2" {
    ami="ami-123456789"
    tags= {
        name= "Hello world"
    }
    lifecycle {
      ignore_changes = [ tags ]
      prevent_destroy = true
      create_before_destroy = true
#      replace_triggered_by = [  ]
    }
}