# Declaring a module with the name ec2
module "ec2" {
    source  =   "./ec2"
    sg      =   module.sg.sg_id
}

# Declaring a module with the name sg
module "sg" {
    source  =   "./sg"
}

# Printing the output from ec2 module

output "private_dns" {
    value = module.ec2.private_dns
}