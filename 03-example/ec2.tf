# Always start with declaring provider information first 

provider "aws" {
   region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-02fd2e8a76f43c89e"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-Instance"
  }
}