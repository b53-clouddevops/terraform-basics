# Block to create EC2
resource "aws_instance" "web" {
  ami                       = "ami-02fd2e8a76f43c89e"
  instance_type             = "t3.nano"
  vpc_security_group_ids    = [var.sg_id]

  tags = {
    Name        = "Terraform-Instance-Server-Name"
  }
}

variable "sg_id" {}

# output "private_dns" {
#     value = aws_instance.web.private_dns
# }

# Test Comment
