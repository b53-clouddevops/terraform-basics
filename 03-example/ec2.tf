# Always start with declaring provider information first 
provider "aws" {
   region = "us-east-1"
}

# Block to create EC2
resource "aws_instance" "web" {
  ami           = "ami-02fd2e8a76f43c89e"
  instance_type = "t3.nano"

  tags = {
    Name = "Terraform-Instance-Server-Name"
  }
}

# Block to print the attribute 
output "private_dns_of_server" {
    value = aws_instance.web.private_dns 
}