# Declaring provider information

# Always start with declaring provider information first 
provider "aws" {
   region = "us-east-1"
}

# Declaring the remote backend; This will keep the state files in a remote s3 buckets and this will let team collaboration
terraform {
  backend "s3" {
    bucket = "b53-tfstate-bucket"
    key    = "modules/tf/terraform.tfstate"
    region = "us-east-1"
  }
}