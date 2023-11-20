provider "aws" {
    region = "us-east-1"
}

import {
  id = "terraform-remote-tfstate"
  to = aws_dynamodb_table.terraform-remote-tfstate
}