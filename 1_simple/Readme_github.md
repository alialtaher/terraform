**IN github.tf we have the following components**
1. terraform settings 
    - required providers
        - name: the name of the provider, In this example, we are using github
        - source: Since this provider is developed by integrations, we specified this variable
        - version "optional": in this case, any version between 5.0 --> 5.9 will be acceptable
2. provider meta-argument
        here, according to the documentation, and following to our usecase, We need to specify the token which we can create a github repository to hold our code
3. Resource block:
    Each resource block describes one or more infrastructure objects, such as virtual networks, compute instances, or higher-level components such as DNS records.
    Syntax is:
        - resource "resource type" "resource name" 
            In our case, the resource type is github repository, The resource name in terms of HCL is EXAMPLE_TERRAFORM, the compination of resource type and  resource name must be unique within a module 
        - provider arguments: provider specific settings 
            name: the name of the github repository
            description: the description of the github repository
            visibility: public or private


**How to run this plan**
1. run "terraform init" ?? used to initialize the working directory by downloading the      required providers, moldules in order to run this plan 
2. run "terraform plan" ?? used to provide a specific plan to match the current state "github" with the desired state "terraform code"
basically it will query the current state, generate a terraform.tfstate file, which contains the current state data, check what are the needed changes in order to match this two states
3. make sure that the changes in the plan matches your requirements, then run terraform apply 

detailed output 
1. terraform init
    Expected output:  
        Initializing provider plugins...
        - Reusing previous version of integrations/github from the dependency lock file
        - Reusing previous version of hashicorp/aws from the dependency lock file
        - Installing integrations/github v5.40.0...
        - Installed integrations/github v5.40.0 (signed by a HashiCorp partner, key ID 38027F80D7FD5FB2)
        - Installing hashicorp/aws v5.22.0...
        - Installed hashicorp/aws v5.22.0 (signed by HashiCorp)

        Partner and community providers are signed by their developers.
        If you'd like to know more about provider signing, you can read about it here:
        https://www.terraform.io/docs/cli/plugins/signing.html

        Terraform has been successfully initialized!

        You may now begin working with Terraform. Try running "terraform plan" to see
        any changes that are required for your infrastructure. All Terraform commands
        should now work.

        If you ever set or change modules or backend configuration for Terraform,
        rerun this command to reinitialize your working directory. If you forget, other
        commands will detect it and remind you to do so if necessary.

        root@versioncontrol:/home/alialt/training/terraform/simple# ls -ltra
            Expected output:
            total 36
            drwxr-xr-x  3 root root 4096 Oct 26 13:22 .terraform
            -rw-r--r--  1 root root 2607 Oct 26 14:53 .terraform.lock.hcl
            -rw-r--r--  1 root root 7528 Oct 26 15:23 terraform.tfstate.backup
            -rw-r--r--  1 root root 2967 Oct 26 15:23 terraform.tfstate
            drwxr-xr-x  3 root root 4096 Oct 30 16:07 .
            -rw-r--r--  1 root root  304 Nov  2 12:05 demo.tf
            -rw-r--r--  1 root root  432 Nov  2 12:05 github.tf
            drwxr-xr-x 27 root root 4096 Nov 21 12:40 ..
2. root@versioncontrol:/home/alialt/training/terraform/simple# terraform plan
    Expected output: 
      # github_repository.EXAMPLE_TERRAFORM will be created
  + resource "github_repository" "EXAMPLE_TERRAFORM" {
      + allow_auto_merge            = false
      + allow_merge_commit          = true
      + allow_rebase_merge          = true
      + allow_squash_merge          = true
      + archived                    = false
      + default_branch              = (known after apply)
      + delete_branch_on_merge      = false
      + description                 = "a public repository created by terraform"
      + etag                        = (known after apply)
      + full_name                   = (known after apply)
      + git_clone_url               = (known after apply)
      + html_url                    = (known after apply)
      + http_clone_url              = (known after apply)
      + id                          = (known after apply)
      + merge_commit_message        = "PR_TITLE"
      + merge_commit_title          = "MERGE_MESSAGE"
      + name                        = "Terraform_example_repo"
      + node_id                     = (known after apply)
      + primary_language            = (known after apply)
      + private                     = (known after apply)
      + repo_id                     = (known after apply)
      + squash_merge_commit_message = "COMMIT_MESSAGES"
      + squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
      + ssh_clone_url               = (known after apply)
      + svn_url                     = (known after apply)
      + topics                      = (known after apply)
      + visibility                  = "public"
    }
3. root@versioncontrol:/home/alialt/training/terraform/simple# terraform apply
        github_repository.EXAMPLE_TERRAFORM: Refreshing state... [id=Terraform_example_repo]

        Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
        + create

        Terraform will perform the following actions:

        # github_repository.EXAMPLE_TERRAFORM will be created
        + resource "github_repository" "EXAMPLE_TERRAFORM" {
            + allow_auto_merge            = false
            + allow_merge_commit          = true
            + allow_rebase_merge          = true
            + allow_squash_merge          = true
            + archived                    = false
            + default_branch              = (known after apply)
            + delete_branch_on_merge      = false
            + description                 = "a public repository created by terraform"
            + etag                        = (known after apply)
            + full_name                   = (known after apply)
            + git_clone_url               = (known after apply)
            + html_url                    = (known after apply)
            + http_clone_url              = (known after apply)
            + id                          = (known after apply)
            + merge_commit_message        = "PR_TITLE"
            + merge_commit_title          = "MERGE_MESSAGE"
            + name                        = "Terraform_example_repo"
            + node_id                     = (known after apply)
            + primary_language            = (known after apply)
            + private                     = (known after apply)
            + repo_id                     = (known after apply)
            + squash_merge_commit_message = "COMMIT_MESSAGES"
            + squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
            + ssh_clone_url               = (known after apply)
            + svn_url                     = (known after apply)
            + topics                      = (known after apply)
            + visibility                  = "public"
            }

        Plan: 2 to add, 0 to change, 0 to destroy.

        Do you want to perform these actions?
        Terraform will perform the actions described above.
        Only 'yes' will be accepted to approve.


if you approved this change by typing yes, the resource will be created, the file terraform.tfstate file will be updated with the current state,
to destroy this infrastructure, you can run terraform destroy, approve the request when you make sure that it matches your expectations.


        