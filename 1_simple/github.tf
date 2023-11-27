terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = ""
}
resource "github_repository" "EXAMPLE_TERRAFORM" {
  name        = "Terraform_example_repo"
  description = "a public repository created by terraform"
  visibility  = "public"
}
