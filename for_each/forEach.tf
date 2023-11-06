provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "Workload" {
    ami = "ami-123456"
    for_each = {
      "key1" = "value1"
      "key2" = "value2"
    }
    instance_type = each.value
    key_name = each.key

    tags = {
        name = each.key
    }
}