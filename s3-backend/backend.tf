terraform {
  backend "s3" {
    bucket = "terraform-state-files-alialt"
    key = "ec2/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-remote-tfstate"    
  }
}