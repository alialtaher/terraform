**IN demo.tf we have the following components**
1. provider section: 
    in this case, the provier is aws, This provider image is officialy maintained by hashicorp, therefore, no need to explicitly mention the source as we did in github
    *the parameters inside the aws provider are senesitve, there is a more secure ways to configure access_key and secret_key other than plaintext, In this case, I configured my credintials using aws cli, terraform is smart enough to read those values from ~/.aws/credintials*

2. resource section: 
    in this case, we have two required parameters: 
    - ami: hardcoded, its much better to use "data source" in order to fetch the latest ami dynamically 
    - instance_type: also hardcoded, better to use variables


**how to run** 
1. terraform init
2. terraform plan 
3. terraform apply --auto-approve

**how to destroy**
1. terraform destroy --auto-approve