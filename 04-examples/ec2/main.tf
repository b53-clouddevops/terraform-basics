# Block to create EC2
resource "aws_instance" "web" {
  ami                       = data.aws_ami.my_ami.image_id
  instance_type             = "t3.nano"
  vpc_security_group_ids    = [var.sg]

  tags = {
    Name        = "Terraform-Instance-Server-Name"
  }

# Declaring the remote provisioner inside the resource
  provisioner "remote-exec" {

      connection {                  // establishes connectivity to the created machine
        type     = "ssh"
        user     = "centos"
        password = "DevOps321"
        host     = self.private_ip
      }

    inline = [
        "ansible-pull -U https://github.com/b53-clouddevops/ansible.git robot-pull.yml -e ENV=dev -e COMPONENT=mongodb"
    ]
  }
}


variable "sg" {}

output "private_dns" {
    value = aws_instance.web.private_dns
}

# Test Comment
