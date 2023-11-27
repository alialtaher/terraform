**Terraform requires explicit source information for any providers that are not
HashiCorp-maintained, using a new syntax in the required_providers nested
block inside the terraform configuration block**

In this terraform file, we can't use digital ocean provider without declaring the required_provider section **in terraform settings block** 

terraform --> 
    required_providers --> 
        digitalocean --> 
            source "maintainer/provider" 
provider block

resource block
