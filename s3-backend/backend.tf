terraform {
  backend "s3" {
    bucket = "terraform-state-files-alialt"
    keykey = "ec2/terraform.tfstate"
    region = "us-east-1"    
  }
}