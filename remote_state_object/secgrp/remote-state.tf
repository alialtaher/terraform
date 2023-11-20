data "terraform_remote_state" "EIP" {
    backend = "s3"
    config = {
        bucket = "terraform-state-files-alialt"
        key = "ec2/terraform.tfstate"
        region = "us-east-1"
     }
  
}