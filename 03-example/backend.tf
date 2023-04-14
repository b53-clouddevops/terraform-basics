# Declaring the remote backend; This will keep the state files in a remote s3 buckets and this will let team collaboration
terraform {
  backend "s3" {
    bucket = "b53-tfstate-bucket"
    key    = "dev/ec2/"
    region = "us-east-1"
  }
}